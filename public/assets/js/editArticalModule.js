$(function(){
    var artModule = {
        formNode: $('#J_formModule'),
        baseurl: '/admin/modules/',
        submitObj: {
            add: {url: 'addModule', type: 'POST'}, 
            edit: {url: 'editModule', type: 'PUT'}
        },
        init: function(){
            var me = this;
            me.bindHandler();
            //init test
            $('.nav-tabs li').eq(1).find('a').click();
            $('.module-list li').eq(4).find('.glyphicon-edit').click();
        },
        bindHandler: function(){
            var me = this;
            //nav
            $('.nav-tabs li a').on('click', function(e){
                setTimeout(function(){
                    if($('.nav-tabs li').eq(1).hasClass('active')){
                        $('.control-group-tab').css('visibility', 'hidden');
                    }else{
                        $('.control-group-tab').css('visibility', 'visible');
                        // me.formNode.removeClass('active');
                    }
                }, 0);
            });
            //add
            $('#tab-module .module-add').on('click',function(e){
                //clean
                me.formNode.find('form')[0].reset(); //重置form
                $('#module_type').change();
                me.formNode.find('.form-group').removeClass('has-error');
                //show
                me.formNode.attr('data-action','add');
                // me.formNode.addClass('active');
            });
            //edit
            $('#tab-module .module-list .glyphicon-edit').on('click', function(e){
                //data
                var id = $(this).parents('li').attr('data-id');
                var url = me.baseurl+'editModule';
                $.ajax({
                    url: url,
                    data: {id:id},
                    success: function(data){
                        if(data.status == 'success'){
                            me.renderForm(data.data);
                            //show
                            me.formNode.attr('data-action','edit');
                            // me.formNode.addClass('active');
                        }
                    }
                });
            });
            //del
            $('#tab-module .module-list .glyphicon-trash').on('click', function(e){
                //data
                var itemNode = $(this).parents('li');
                var id = itemNode.attr('data-id');
                var url = me.baseurl+'deleteModule';
                $.ajax({
                    url: url,
                    data: {id:id},
                    success: function(data){
                        if(data.status == 'success'){
                            itemNode.remove();
                        }else{
                            alert(data.msg);
                        }
                    }
                });
            });
            //swith-type
            $('#module_type').change(function(){
                var type = $(this).val();
                var cls = $('#J_formModule').attr('class');
                cls = cls.replace(/ type-\w*/g,'');
                cls += ' type-'+type
                $('#J_formModule').attr('class',cls);
            });

            //submit
            $('#J_submit').on('click', function(e){
                //show
                e.preventDefault();
                var data = $('#J_formModule form').serialize();
                //action
                var action = me.formNode.attr('data-action');
                var url = me.baseurl+me.submitObj[action].url;
                $.ajax({
                    url: url,
                    data: data,
                    type : me.submitObj[action].type,
                    success: function(data){
                        if(data.status == 'success'){
                            me.renderModuleItem(data.data);
                            me.formNode.removeClass('active');
                        }else if(data.status == 'verify'){
                            me.addErrorMsg(data.msg);
                            alert('verify error');
                        }else{
                            alert('error');
                        }
                        //close modal
                        $('#J_moduleContentModal').modal('hide');
                    }
                })
            });
            //upload - image
            var uploadButton = $('<button/>')
                .addClass('btn btn-primary')
                .prop('disabled', true)
                .text('Processing...')
                .on('click', function () {
                    var $this = $(this),
                        data = $this.data();
                    $this
                        .off('click')
                        .text('Abort')
                        .on('click', function () {
                            $this.remove();
                            data.abort();
                        });
                    data.submit().always(function () {
                        $this.remove();
                    });
                    return false;
                });
            //upload - image
            $('#upload_image').fileupload({
                url: me.baseurl+'uploadPic',
                dataType: 'json',
                autoUpload: false,
                acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
                maxFileSize: 5000000, // 5 MB
                previewMaxWidth: 100,
                previewMaxHeight: 100,
                previewCrop: true,
                done: function(e, data){
                    var result = data.result;
                    if(result.status == 'success'){
                        var url = result.data.url;
                        $('#module_image').val(url);
                    }else{
                        alert(result.msg);
                    }
                }
            }).on('fileuploadadd', function (e, data) {
                data.context = $('<div/>');
                $('#J_files').html(data.context);
                data.context.attr('class','file-item');
                $.each(data.files, function (index, file) {
                    var node = $('<p/>')
                            .append($('<span/>').text(file.name));
                    if (!index) {
                        node
                            .append('<br>')
                            .append(uploadButton.clone(true).data(data));
                    }
                    node.appendTo(data.context);
                });
            }).on('fileuploadprocessalways', function (e, data) {
                var index = data.index,
                    file = data.files[index],
                    node = $(data.context.children()[index]);
                if (file.preview) {
                    node
                        .prepend('<br>')
                        .prepend(file.preview);
                }
                if (file.error) {
                    node
                        .append('<br>')
                        .append($('<span class="text-danger"/>').text(file.error));
                }
                if (index + 1 === data.files.length) {
                    data.context.find('button')
                        .text('Upload')
                        .prop('disabled', !!data.files.error);
                }
            });
        },
        renderModuleItem: function(data){
            var me = this;
            var id = data.id;
            var node = $('#tab-module li[data-id='+id+']');
            node.find('h4').text(data.title);
        },
        renderForm: function(data){
            var me = this;
            var item, node;
            for(item in data){
                node = $('#module_'+item);
                node.val(data[item]);
            }
            $('#module_type').change();
            //image
            if(data.image){
                me.renderUploadImage(data.image)
            }
        },
        addErrorMsg: function(msgObj){
            var me = this;
            var prefix = 'module_';
            var item, txt, node;
            for(item in msgObj){
                txt = msgObj[item][0];
                node = $('#'+prefix+item);
                me.addItemErrMsg(txt, node);
            }
        },
        addItemErrMsg: function(msg, node){
            var parent = node.parent();
            var errNode = parent.find('.control-label');
            if(errNode.length == 0){
                errNode = $('<span class="control-label error-lable"></span>');
                errNode.insertBefore(node);
            }
            errNode.text(msg);
            parent.addClass('has-error');
        },
        renderUploadImage: function(url){
            var me = this;
            var node = $('<div class="file-item"><img src="'+url+'" ></div>');
            $('#J_files').html(node);
        }
    };
    //init
    artModule.init();
});
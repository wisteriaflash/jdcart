@extends('layouts.admin', array('active' => $resource))

@section('title') @parent 添加新{{ $resourceName }} @stop

@section('beforeStyle')
    @parent
    {{ style('bootstrap-markdown') }}
    {{ HTML::style('assets/plugin/jQueryFileUpload/css/jquery.fileupload.css') }}
    {{ HTML::style('assets/css/admin/edit-article.css') }}
@stop

@section('style')
.nav-tabs>li.active>a
{
    background-color: #f8f8f8 !important;
}
@parent @stop

@section('container')

    @include('widgets.notification')
    <h3>
        添加新{{ $resourceName }}
        <div class="pull-right">
            <a href="{{ route($resource.'.index') }}" class="btn btn-sm btn-default">
                &laquo; 返回{{ $resourceName }}列表
            </a>
        </div>
    </h3>

    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab-general" data-toggle="tab">主要内容</a></li>
        <li>
          <a href="#tab-module" data-toggle="tab">模块内容</a>
        </li>
        <li><a href="#tab-meta-data" data-toggle="tab">SEO</a></li>
    </ul>

    <form id="J_mainForm" class="form-horizontal" method="post" action="{{ route($resource.'.store') }}" autocomplete="off"
        style="background:#f8f8f8;padding:1em;border:1px solid #ddd;border-top:0;">
        <!-- CSRF Token -->
        <input type="hidden" name="_token" value="{{ csrf_token() }}" />
        <input type="hidden" name="id" value="{{$data_emptyID}}" />
        <!-- Tabs Content -->
        <div class="tab-content">

            <!-- General tab -->
            <div class="tab-pane active" id="tab-general" style="margin:0 1em;">

                <div class="form-group">
                    <label for="category">分类</label>
                    {{ $errors->first('category', '<span style="color:#c7254e;margin:0 1em;">:message</span>') }}
                    <select class="form-control" name="category" id="category">
                      @include('widgets.optionSubcates', array('items' => $categoryLists, 'dataid' => null))
                  </select>
                </div>

                <div class="form-group">
                    <label for="title">标题</label>
                    {{ $errors->first('title', '<span style="color:#c7254e;margin:0 1em;">:message</span>') }}
                    <input class="form-control" type="text" name="title" id="title" value="{{ Input::old('title') }}" />
                </div>

                <div class="form-group" style="display:none;">
                    <label for="slug">Slug</label>
                    {{ $errors->first('slug', '<span style="color:#c7254e;margin:0 1em;">:message</span>') }}
                    <div class="input-group">
                        <span class="input-group-addon" >
                            {{ str_finish(URL::to('/'), '/') }}
                        </span>
                        <input class="form-control" type="text" name="slug" id="slug" value="{{ Input::old('slug') }}">
                    </div>
                </div>

                <div class="form-group" style="display:none;">
                    <label for="content">内容</label>
                    {{ $errors->first('content', '<span style="color:#c7254e;margin:0 1em;">:message</span>') }}
                    <textarea id="content" class="form-control" data-provide="markdown"
                        name="content" rows="10">{{ Input::old('content') }}</textarea>
                </div>

            </div>

            <!-- Module tab -->
              <div class="tab-pane" id="tab-module">
                <div class="form-group" style="margin: 0 0 15px;">
                  <span class="radio-inline" style="padding-left: 0; cursor: default; font-weight: 700;">模块列表展开：</span>
                  <label class="radio-inline">
                    {{ Form::radio('module_extend', 1, false, array('class' => 'module_extend')) }}是
                  </label>
                  <label class="radio-inline">
                    {{ Form::radio('module_extend', 0, true, array('class' => 'module_extend')) }}否
                  </label>
                </div>
                <ul class="module-list module-sortable">
                </ul>
                <ul class="module-list module-nodrop clearfix">
                  <li class="module-add" data-toggle="modal" data-target="#J_moduleContentModal">
                    <div class="glyphicon glyphicon-plus"></div>
                  </li>
                </ul>
              </div>

            <!-- Meta Data tab -->
            <div class="tab-pane" id="tab-meta-data" style="margin:0 1em;">

                <div class="form-group">
                    <label for="meta_title">Meta Title</label>
                    <input class="form-control" type="text" name="meta_title" id="meta_title" value="{{ Input::old('meta_title') }}" />
                </div>

                <div class="form-group">
                    <label for="meta_description">Meta Description</label>
                    <input class="form-control" type="text" name="meta_description" id="meta_description" value="{{ Input::old('meta_description') }}" />
                </div>

                <div class="form-group">
                    <label for="meta_keywords">Meta Keywords</label>
                    <input class="form-control" type="text" name="meta_keywords" id="meta_keywords" value="{{ Input::old('meta_keywords') }}" />
                </div>

            </div>

        </div>

        <!-- Form actions -->
        <div class="control-group">
            <div class="controls">
                <button type="reset" class="btn btn-default">清 空</button>
                <button type="submit" class="btn btn-success">提 交</button>
            </div>
        </div>
    </form>


<!-- 模块内容 Moda - moduleContent edit area -->
<div class="modal fade" id="J_moduleContentModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">模块</h4>
      </div>
      <div class="modal-body">
        <div id="J_formModule" class="form-module">
          <form class="form-horizontal" action="">
            <!-- hidden input -->
            <input type="hidden" name="article_id" value="{{$data_emptyID}}" />
            <input type="hidden" name="module_id" id="module_id" value="" />
            <input type="hidden" name="module_image" id="module_image" value="" />
            <input type="hidden" name="module_download" id="module_download" value="" />
            <!-- from content -->
            <div class="form-group">
              <label for="module_title">模块标题</label>
              <input class="form-control" type="text" name="module_title" id="module_title" value="" />
            </div>
            <div class="form-group">
              <label for="module_title">模块标题 - 英文</label>
              <input class="form-control" type="text" name="module_title_en" id="module_title_en" value="" />
            </div>
            <div class="form-group">
              <label for="module_type">模块类型</label>
              <select class="form-control" name="module_type" id="module_type">
                <option value="txtimg">左文右图</option>
                <option value="txt">纯文字</option>
                <option value="img">纯图片</option>
              </select>
            </div>
            <div class="form-group form-txt">
              <label for="module_content">模块内容</label>
              <textarea id="module_content" class="form-control" data-provide="markdown" name="module_content" rows="10"></textarea>
            </div>
          </form>
          <div class="form-group form-img clearfix">
            <div class="add-files">
              <label for="upload_image">模块图片</label>
              <span class="btn btn-default fileinput-button">
                <i class="glyphicon glyphicon-plus"></i>
                <span>上传图片</span>
                {{ Form::file('upload_image', array('class' => 'file_image file', 'id' => 'upload_image', 'multiple' => true)) }}
              </span>
              <span id="J_uploadAllPic" class="btn btn-xs btn-primary upload-all"><i class="glyphicon glyphicon-upload"></i>全部上传</span>
            </div>
            <div id="J_files" class="files-list"></div>
          </div>
          <div class="form-group form-download">
            <label for="upload_donwload">模块下载文件</label>
            <div id="J_uploadDownload" class="upload-download">
              <span class="btn btn-default fileinput-button">
                <i class="glyphicon glyphicon-plus"></i>
                <span>上传文件</span>
                {{ Form::file('upload_donwload', array('class' => 'file_download file', 'id' => 'upload_donwload')) }}
              </span>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" id="J_cancel" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" id="J_submit" class="btn btn-primary">提交</button>
      </div>
    </div>
  </div>
</div>
@stop

@section('end')
    @parent
    {{ script('markdown', 'to-markdown', 'bootstrap-markdown') }}
    {{ HTML::script('assets/plugin/jQueryFileUpload/dist/fileUpload.js') }}
    {{ HTML::script('assets/plugin/jQuerySortable/jquery-sortable-min.js') }}

  {{ HTML::script('assets/js/base.js') }}
  {{ HTML::script('assets/js/editArticalModule.js') }}
  <script>
  $('#J_mainForm').submit(function(e){
    if($('#title').val().length == 0){
        alert('请填写标题');
        return false;
      }
  });
  </script>
@stop

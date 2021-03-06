<?php

use \Michelf\MarkdownExtra;

/**
 * 文章
 */
class Article extends BaseModel
{
    /**
     * 软删除
     * @var boolean
     */
    protected $softDelete = true;

/*
|--------------------------------------------------------------------------
| 模型对象关系
|--------------------------------------------------------------------------
*/
    /**
     * 文章的分类
     * 一对多逆向
     * @return object Category
     */
    public function category()
    {
        return $this->belongsTo('Category', 'category_id');
    }

    /**
     * 文章的作者
     * 一对多逆向
     * @return object User
     */
    public function user()
    {
        return $this->belongsTo('User', 'user_id');
    }

    /**
     * 文章的评论
     * 一对多
     * @return object Illuminate\Database\Eloquent\Collection
     */
    public function comments()
    {
        return $this->hasMany('Comment', 'article_id');
    }

    /**
     * 文章的模块内容
     * 一对多
     * @return object Illuminate\Database\Eloquent\Collection
     */
    public function modules()
    {
        return $this->hasMany('Module', 'article_id')->orderBy('sort_order');
    }

/*
|--------------------------------------------------------------------------
| 访问器
|--------------------------------------------------------------------------
*/
    /**
     * 文章内容（原始）
     * @return string
     */
    public function getContentAttribute($value)
    {
        return strip($value);
    }

    /**
     * 文章内容（HTML 格式）
     * @return string
     */
    public function getContentHtmlAttribute()
    {
        switch ($this->content_format) {
            case 'markdown':
                return MarkdownExtra::defaultTransform($this->content);
            case 'html':
                return $this->content;
        }
    }

    /**
     * 文章内容（Markdown 格式）
     * @return string
     */
    public function getContentMarkdownAttribute()
    {
        switch ($this->content_format) {
            case 'markdown':
                return $this->content;
            case 'html':
                return new HTML_To_Markdown($this->content);
        }
    }
}
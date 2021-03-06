@extends('layouts.base')

@section('title') Simple - Blog @parent @stop

@section('beforeStyle')
    {{ style('bootstrap-3.2.0') }}
@parent @stop

@section('style')
body
{
    padding-bottom: 0;
    background-color: #f3f3ff;
}
@parent @stop

@section('body')

    @include('widgets.blogNavbar', array('activeCategory' => 0))

    <div class="container panel" style="margin-top:5em; padding-bottom:1em;">
        @yield('container')
    </div>

@stop

@section('end')
    {{ script('jquery-1.10.2', 'bootstrap-3.2.0') }}
@parent @stop

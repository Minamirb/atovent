require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  setup do
    @page = pages('http://t.co/X87gPn7b')
    @log = logs('three')
    stub_request(:get, "http://t.co/X87gPn7b").
  with(:headers => {'Accept'=>'*/*', 'Accept-Charset'=>'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'Accept-Encoding'=>'gzip,deflate,identity', 'Accept-Language'=>'en-us,en;q=0.5', 'Connection'=>'keep-alive', 'Host'=>'t.co', 'Keep-Alive'=>'300', 'User-Agent'=>'Mechanize/2.0.1 Ruby/1.9.2p290 (http://github.com/tenderlove/mechanize/)'}).
  to_return(:status => 200, :body => "", :headers => {})
    stub_request(:get, "http://t.co/X87gPn7b").
          with(:headers => {'Accept'=>'*/*', 'Accept-Charset'=>'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'Accept-Encoding'=>'gzip,deflate,identity', 'Accept-Language'=>'en-us,en;q=0.5', 'Connection'=>'keep-alive', 'Host'=>'t.co', 'Keep-Alive'=>'300', 'User-Agent'=>'Mechanize/2.0.1 Ruby/1.9.2p290 (http://github.com/tenderlove/mechanize/)'}).
          to_return(:status => 200, :body => "", :headers => {})
    stub_request(:get, "http://t.co/X87gPn7b").
          with(:headers => {'Accept'=>'*/*', 'Accept-Charset'=>'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'Accept-Encoding'=>'gzip,deflate,identity', 'Accept-Language'=>'en-us,en;q=0.5', 'Connection'=>'keep-alive', 'Host'=>'t.co', 'Keep-Alive'=>'300', 'User-Agent'=>'Mechanize/2.0.1 Ruby/1.9.2p290 (http://github.com/tenderlove/mechanize/)'}).
          to_return(:status => 200, :body => "", :headers => {})
    stub_request(:get, "http://t.co/X87gPn7b").
          with(:headers => {'Accept'=>'*/*', 'Accept-Charset'=>'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'Accept-Encoding'=>'gzip,deflate,identity', 'Accept-Language'=>'en-us,en;q=0.5', 'Connection'=>'keep-alive', 'Host'=>'t.co', 'Keep-Alive'=>'300', 'User-Agent'=>'Mechanize/2.0.1 Ruby/1.9.2p290 (http://github.com/tenderlove/mechanize/)'}).
          to_return(:status => 200, :body => "", :headers => {})
    stub_request(:get, "http://t.co/X87gPn7b").
          with(:headers => {'Accept'=>'*/*', 'Accept-Charset'=>'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'Accept-Encoding'=>'gzip,deflate,identity', 'Accept-Language'=>'en-us,en;q=0.5', 'Connection'=>'keep-alive', 'Host'=>'t.co', 'Keep-Alive'=>'300', 'User-Agent'=>'Mechanize/2.0.1 Ruby/1.9.2p290 (http://github.com/tenderlove/mechanize/)'}).
          to_return(:status => 200, :body => "", :headers => {})
    stub_request(:get, "http://t.co/X87gPn7b").
          with(:headers => {'Accept'=>'*/*', 'Accept-Charset'=>'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'Accept-Encoding'=>'gzip,deflate,identity', 'Accept-Language'=>'en-us,en;q=0.5', 'Connection'=>'keep-alive', 'Host'=>'t.co', 'Keep-Alive'=>'300', 'User-Agent'=>'Mechanize/2.0.1 Ruby/1.9.2p290 (http://github.com/tenderlove/mechanize/)'}).
          to_return(:status => 200, :body => "", :headers => {})
    stub_request(:get, "http://t.co/X87gPn7b").
          with(:headers => {'Accept'=>'*/*', 'Accept-Charset'=>'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'Accept-Encoding'=>'gzip,deflate,identity', 'Accept-Language'=>'en-us,en;q=0.5', 'Connection'=>'keep-alive', 'Host'=>'t.co', 'Keep-Alive'=>'300', 'User-Agent'=>'Mechanize/2.0.1 Ruby/1.9.2p290 (http://github.com/tenderlove/mechanize/)'}).
          to_return(:status => 200, :body => "", :headers => {})
    stub_request(:get, "http://t.co/X87gPn7b").
          with(:headers => {'Accept'=>'*/*', 'Accept-Charset'=>'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'Accept-Encoding'=>'gzip,deflate,identity', 'Accept-Language'=>'en-us,en;q=0.5', 'Connection'=>'keep-alive', 'Host'=>'t.co', 'Keep-Alive'=>'300', 'User-Agent'=>'Mechanize/2.0.1 Ruby/1.9.2p290 (http://github.com/tenderlove/mechanize/)'}).
          to_return(:status => 200, :body => "", :headers => {})
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page" do
    assert_difference('Page.count') do
      post :create, id: @log.id
    end

    assert_redirected_to page_path(assigns(:page))
  end

  test "should show page" do
    get :show, id: @page.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page.to_param
    assert_response :success
  end

  test "should update page" do
    put :update, id: @page.to_param, page: @page.attributes
    assert_redirected_to page_path(assigns(:page))
  end

  test "should destroy page" do
    assert_difference('Page.count', -1) do
      delete :destroy, id: @page.to_param
    end

    assert_redirected_to pages_path
  end
end

require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @product.title + '1' } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @product.title + '2' } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
    delete product_url(@product)
    end
    
    assert_redirected_to products_url
  end

  test 'should correct render page with ordered products' do
    get store_index_path
    product = Product.order(:title).first

    assert_response :success
    assert_select   'h2', text: product.title
  end

  test "can't delete product in cart" do
    assert_difference('Product.count', 0) do
    delete product_url(products(:two))
    end
    assert_redirected_to products_url
  end
end

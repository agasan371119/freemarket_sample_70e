$(document).on('turbolinks:load'),function(){

  $(document).on('click', '.item__post__container__first__image', function(){
    var preview = $('<div class="image-preview__wapper"><img class="preview"></div><div class="image-preview_btn"><div class="image-preview_btn_edit">編集</div><div class="image-preview_btn_delete">削除</div></div>'); 
    var append_input = $(`<li class="input"><label class="upload-label"><div class="upload-label__text">ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード<div class="input-area"><input class="hidden image_upload" type="file"></div></div></label></li>`)
    var append_input = $(`
                        <div class="item__post__container__first__image"">
                          <p class="item__post__container__first__image__p">"ドラッグアンドドロップ"<br>"またはクリックしてファイルをアップロード"</p>
                          <div class="hidden-content">
                            <input class="hidden-field" type="file" name="item[item_images_attributes][0][item_images]" id="item_item_images_attributes_0_item_images">
                            <input class="hidden-field" type="file" name="item[item_images_attributes][1][item_images]" id="item_item_images_attributes_1_item_images">
                          </dv>
                        </div>
    `)
    
    



  })
}
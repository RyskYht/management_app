// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

/* global $ */

$(document).on(turbolinks:load, function() {
  /* fadeoutTargetというclassを持った要素を選択 */
  const fadeoutElement = document.querySelector(".flash");
  /* 一定時間経過したらfadeoutというclassを追加する */
  function flashFadeout() {
    setTimeout(function() {
      fadeoutElement.classList.add("fadeout");
    }, 5000);
  }
  /* fadeoutTargetという要素を持ったdocumentがあれば実行 */
  if (fadeoutElement != null) {
    window.onload = flashFadeout();
  }
}
$(document).ready(function() {
   $('a.article-toggle').click(toggleAbstract);
   $('.submissions a.submission-article').click(slideDownSubmission);
   $(".checkboxs input[type='checkbox']").click(progress_checkbox);
});

var toggleAbstract = function (event) {
   event.preventDefault();
   var article_details = $(this).parent().siblings('.article-info');
   article_details.slideToggle( "slow", function() {} );
}

var checkboxsAreChecked = function (event) {
   event.preventDefault();
   var checkbox = $(".checkboxs input[type='checkbox']").length;
   var checked = $(".checkboxs input[type='checkbox']:checked").length;
   var alert = $(".submissions .alert.alert-danger");

   if (checkbox == checked) {
      alert.slideUp( "slow", function() {} );
      var url = $(this).attr('href');
      console.log(url);
      window.open(url,'_blank');
   } else {
      alert.show();
   }
}

var slideDownSubmission = function (event) {
   event.preventDefault();
   var article_details = $(this).parent().siblings('.article-info');
   article_details.slideDown( "slow", function() {} );

   $(this).unbind("click", slideDownSubmission);
   $(this).click(checkboxsAreChecked);
}

var progress_checkbox = function (event) {
   var checkbox = $(".checkboxs input[type='checkbox']").length;
   var checked = $(".checkboxs input[type='checkbox']:checked").length;

   var progress = checked / checkbox * 100;
   $("#progress-checkbox .progress-bar").width(progress + "%");

   var alert = $(".submissions .alert.alert-danger");
   if (checkbox == checked) {
      alert.hide();
   }
}

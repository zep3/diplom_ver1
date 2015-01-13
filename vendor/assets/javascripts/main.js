function stepOrStop(){
    $('.js-step-or-stop').click(function(){
        if(confirm('вы уверены?'))
            return true;
        return false;
    })

}


$(document).ready(stepOrStop);
$(document).on('page:load', stepOrStop);
$('#order_form').on('submit',function(){
     message = confirm("Все данные введены правильно? На основе анкеты будет заключаться договор.");
      if(message) {
        return true;
      } else {
       return false;
      }
});


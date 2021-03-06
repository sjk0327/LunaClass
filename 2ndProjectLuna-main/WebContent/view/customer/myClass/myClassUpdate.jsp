<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@page import="vo.ClassBean"%>
<% ClassBean updateClass = (ClassBean) request.getAttribute("updateClass"); %>  
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<title>λλνκΈ° : LunaClass</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<style type="text/css">
	@media only screen and (max-width: 576px) {
	  .writeFormClassLoad {
	     margin:159.225px auto 0 auto !important;
	  }
	}
   .writeFormClassLoad{
      margin:116px auto;
      background-color:white;
   }
   select{
      height: 43px;
      border-radius: 30px !important;
      padding: 0.375rem 0.75rem;
   }

   img{
     width:180px;
     height:180px;
     object-fit: cover;
     object-position: 50% 100%;
     border-radius: 5px;
   }
   
   img:hover{
    cursor: pointer;
   }
   
   #writeButtons{
   padding: 0 15px;
   margin-top: 20px;
   margin-bottom: 40px;
   }
   
   	@media only screen and (min-width: 576px) {
	  #writeFormBody{
	      border-radius: 10px;
	      box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
	   }
	}
	
   body{
      background-color: #F1F1F1 !important;
   }
   
#CL_IMG_PATH{
      display: none;
   }
#curIMG{
      display: none;
       position: absolute;
      top: 75%;
      left: 15%;
      border-radius: 5px;
      padding: 6px 12px;
      background-color: rgba(241, 241, 241, .85);
      border: none;
   }
#nullDelIMG{
      display: none;
      position: absolute;
      top: 75%;
      left: 1%;
      border-radius: 5px;
      padding: 6px 12px;
      background-color: rgba(241, 241, 241, .85);
      border: none;
   }
  
 #delIMG{
      display: inline;
      position: absolute;
      top: 75%;
      left: 1%;
      border-radius: 5px;
      padding: 6px 12px;
      background-color: rgba(241, 241, 241, .85);
      border: none;
   }

 
   #CL_CONTENT{
   border-radius: 10px;
    resize: none;
   }
   
   .image_div{
   position: relative;
   }
   
</style>
</head>
<body>
<jsp:include page="/header.jsp"/>
<div id="writeFormBody" class="container-fluid writeFormClassLoad col-md-8 col-sm-12 py-5 px-lg-5">
      <form action="classUpdate.do" onsubmit="noAlert()" id="formWrite" class="needs-validation" method="post" enctype="multipart/form-data" name="boardform" novalidate>
      <h3 class="text-black h3 site-section-heading text-center">μμ νκΈ°</h3>
         <div class="form-group">
         <input type="hidden" name="CL_ID" value="<%= updateClass.getCL_ID()%>"/>
            <label for="CL_IMG_PATH" class="form-label">λν μ¬μ§</label>
            <div class="image_div">
               
               <img id="class_image_preview" src="<%if(updateClass.getCL_IMG_PATH() != null){ %><%=request.getContextPath()%>/upload/<%=updateClass.getCL_IMG_PATH()%><%}else{%>images/class_default.png<%}%>"
                alt="μμ μ΄λ―Έμ§ μΆκ°νκΈ°" title="μμ μ΄λ―Έμ§ μΆκ°νκΈ°" />
               <input type="hidden" id="whichPic" name="whichPic" value="κΈ°μ‘΄μ¬μ§"/>   
               <input type="hidden" id="pathI" value="<%=updateClass.getCL_IMG_PATH()%>"/>           
               <div class="image_buttons">
               
                  <input type="file" id="CL_IMG_PATH" class="form-control" name="CL_IMG_PATH" accept="image/png, image/jpeg, image/jpg"  />
                  
					<%if(updateClass.getCL_IMG_PATH() != null){ %>
                  <input type="button" id="delIMG" value="μ¬μ§ μ­μ "/>   
                 <input type="button" id="curIMG" value="κΈ°μ‘΄ μ΄λ―Έμ§"/>
              <%}else{ %>
              <input type="button" id="nullDelIMG" value="μ¬μ§ μ­μ "/>   
              <%} %>
               </div>
            </div>
         </div>
         <div class="row">
            <div class = "form-group col-md-6 col-sm-12">
               <label for="CL_NAME">ν΄λμ€ μ΄λ¦</label>
               <input type="text" class="form-control" spellcheck="false" aria-live="polite" name="CL_NAME" 
               placeholder="μ΄λ¦μ μλ ₯ν΄μ£ΌμΈμ" aria-describedby="μμ μ΄λ¦" autocomplete="off" required value="<%= updateClass.getCL_NAME() %>"/>
               <div class="invalid-feedback">μ΄λ¦μ μλ ₯ν΄μ£ΌμΈμ.</div>
            </div>
            <div class="form-group col-md-6 col-sm-12">
               <label for="CL_CATEGORY" class="form-label">μΉ΄νκ³ λ¦¬</label>
               <select class="form-select input-sm category-select" name="CL_CATEGORY" id="CL_CATEGORY" required >
                  <option value="" disabled selected>μΉ΄νκ³ λ¦¬ μ ν</option>
                  <option value="art" <%if( updateClass.getCL_CATEGORY().equals("art")){%> selected <%}%>>μμ </option>
                  <option value="life" <%if( updateClass.getCL_CATEGORY().equals("life")){%> selected <%}%>>λ¬Έν, μν</option>
                  <option value="health" <%if( updateClass.getCL_CATEGORY().equals("health")){%> selected <%}%>>κ±΄κ°, λ―Έμ©</option>
                  <option value="development" <%if( updateClass.getCL_CATEGORY().equals("development")){%> selected <%}%>>IT/κ°λ°</option>
                  <option value="therapy" <%if( updateClass.getCL_CATEGORY().equals("therapy")){%> selected <%}%>>μ¬λ¦¬</option>
                  <option value="etc" <%if( updateClass.getCL_CATEGORY().equals("etc")){%> selected <%}%>>κΈ°ν</option>
               </select>
               <div class="invalid-feedback">μΉ΄νκ³ λ¦¬λ₯Ό μ ν ν΄μ£ΌμΈμ.</div>
            </div>
         </div>
         <div class="row">
         
            <div class="form-group col-md-6 col-sm-12">
               <label for="CL_LOCATION" class="form-label">μμΉ</label>
               <select class="form-select" name="CL_LOCATION" id="CL_LOCATION" required>
                  
                  <option value="" disabled>μμΉ μ ν</option>
                  <option value="κ°λ¨κ΅¬" <%if( updateClass.getCL_LOCATION().equals("κ°λ¨κ΅¬")){%> selected <%}%>>κ°λ¨κ΅¬</option>
                  <option value="κ°λκ΅¬" <%if( updateClass.getCL_LOCATION().equals("κ°λκ΅¬")){%> selected <%}%>>κ°λκ΅¬</option>
                  <option value="κ°λΆκ΅¬" <%if( updateClass.getCL_LOCATION().equals("κ°λΆκ΅¬")){%> selected <%}%>>κ°λΆκ΅¬</option>
                  <option value="κ°μκ΅¬" <%if( updateClass.getCL_LOCATION().equals("κ°μκ΅¬")){%> selected <%}%>>κ°μκ΅¬</option>
                  <option value="κ΄μκ΅¬" <%if( updateClass.getCL_LOCATION().equals("κ΄μκ΅¬")){%> selected <%}%>>κ΄μκ΅¬</option>
                  <option value="κ΄μ§κ΅¬" <%if( updateClass.getCL_LOCATION().equals("κ΄μ§κ΅¬")){%> selected <%}%>>κ΄μ§κ΅¬</option>
                  <option value="κ΅¬λ‘κ΅¬" <%if( updateClass.getCL_LOCATION().equals("κ΅¬λ‘κ΅¬")){%> selected <%}%>>κ΅¬λ‘κ΅¬</option>
                  <option value="κ΄μ²κ΅¬" <%if( updateClass.getCL_LOCATION().equals("κ΄μ²κ΅¬")){%> selected <%}%>>κ΄μ²κ΅¬</option>
                  <option value="λΈμκ΅¬" <%if( updateClass.getCL_LOCATION().equals("λΈμκ΅¬")){%> selected <%}%>>λΈμκ΅¬</option>
                  <option value="λλ΄κ΅¬" <%if( updateClass.getCL_LOCATION().equals("λλ΄κ΅¬")){%> selected <%}%>>λλ΄κ΅¬</option>
                  <option value="λλλ¬Έκ΅¬" <%if( updateClass.getCL_LOCATION().equals("λλλ¬Έκ΅¬")){%> selected <%}%>>λλκ΅¬</option>
                  <option value="λμκ΅¬" <%if( updateClass.getCL_LOCATION().equals("λμκ΅¬")){%> selected <%}%>>λμκ΅¬</option>
                  <option value="λ§ν¬κ΅¬" <%if( updateClass.getCL_LOCATION().equals("λ§ν¬κ΅¬")){%> selected <%}%>>λ§ν¬κ΅¬</option>
                  <option value="μλλ¬Έκ΅¬" <%if( updateClass.getCL_LOCATION().equals("μλλ¬Έκ΅¬")){%> selected <%}%>>μλλ¬Έκ΅¬</option>
                  <option value="μμ΄κ΅¬" <%if( updateClass.getCL_LOCATION().equals("μμ΄κ΅¬")){%> selected <%}%>>μμ΄κ΅¬</option>
                  <option value="μ±λκ΅¬" <%if( updateClass.getCL_LOCATION().equals("μ±λκ΅¬")){%> selected <%}%>>μ±λκ΅¬</option>
                  <option value="μ±λΆκ΅¬" <%if( updateClass.getCL_LOCATION().equals("μ±λΆκ΅¬")){%> selected <%}%>>μ±λΆκ΅¬</option>
                  <option value="μ‘νκ΅¬" <%if( updateClass.getCL_LOCATION().equals("μ‘νκ΅¬")){%> selected <%}%>>μ‘νκ΅¬</option>
                  <option value="μμ²κ΅¬" <%if( updateClass.getCL_LOCATION().equals("μμ²κ΅¬")){%> selected <%}%>>μμ²κ΅¬</option>
                  <option value="μλ±ν¬κ΅¬" <%if( updateClass.getCL_LOCATION().equals("μλ±ν¬κ΅¬")){%> selected <%}%>>μλ±ν¬κ΅¬</option>
                  <option value="μ©μ°κ΅¬" <%if( updateClass.getCL_LOCATION().equals("μ©μ°κ΅¬")){%> selected <%}%>>μ©μ°κ΅¬</option>
                  <option value="μνκ΅¬" <%if( updateClass.getCL_LOCATION().equals("μνκ΅¬")){%> selected <%}%>>μνκ΅¬</option>
                  <option value="μ’λ‘κ΅¬" <%if( updateClass.getCL_LOCATION().equals("μ’λ‘κ΅¬")){%> selected <%}%>>μ’λ‘κ΅¬</option>
                  <option value="μ€κ΅¬" <%if( updateClass.getCL_LOCATION().equals("μ€κ΅¬")){%> selected <%}%>>μ€κ΅¬</option>
                  <option value="μ€λκ΅¬" <%if( updateClass.getCL_LOCATION().equals("μ€λκ΅¬")){%> selected <%}%>>μ€λκ΅¬</option>
               </select>
               <div class="invalid-feedback">μ§μ­μ μ ν ν΄μ£ΌμΈμ.</div>
            </div>
            <div class="form-group col-md-6 col-sm-12">
               <label for="CL_CAPACITY" class="form-label">μ μ<small>(1~100λͺ)</small></label>
               <input type="number" id="CL_CAPACITY" class="form-control" name="CL_CAPACITY" value="<%= updateClass.getCL_CAPACITY() %>" min="1" max="100" required/>
            	<div class="invalid-feedback">1~100μ€μ μμ±ν΄μ£ΌμΈμ.	</div>
            </div>
         </div>
         <div class="form-group">
            <label for="CL_INTRODUCTION" class="form-label">νμ€μκ°</label>
            <input type="text" id="CL_INTRODUCTION" class="form-control" name="CL_INTRODUCTION" autocomplete="off" 
            spellcheck="false" aria-live="polite" placeholder="κ°λ¨νκ² μμμ μ€λͺν΄μ£ΌμΈμ." required maxlength="100" value="<%= updateClass.getCL_INTRODUCTION()%>"/>
            <div class="invalid-feedback">νμ€μκ°λ₯Ό μλ ₯ν΄μ£ΌμΈμ.</div>
         </div>
         <div class="form-group">
            <label for="CL_CONTENT" class="form-label">μ€λͺ<small>(250μ μ΄μ)</small></label>
            <textarea id="CL_CONTENT" class="form-control" name="CL_CONTENT" spellcheck="false" aria-live="polite" 
            placeholder="μμμ μ€λͺν΄μ£ΌμΈμ." rows="8"  required minlength="250" ><%= updateClass.getCL_CONTENT()%></textarea>
            <div class="invalid-feedback" id="contentValidate">μ€λͺμ μλ ₯ν΄μ£ΌμΈμ.</div>
         </div>
         <div class="row">
            <div class = "form-group col-md-6 col-sm-12">
            <label for="CL_START_DATE" class="form-label">μμ μμ λ μ§</label>
               <input type="date" id="CL_START_DATE" class="form-control" name="CL_START_DATE" required value="<%=updateClass.getCL_START_DATE()%>"/>
               </div>
               <div class = "form-group col-md-6 col-sm-12">
            <label for="CL_END_DATE" class="form-label">μμ μ’λ£ λ μ§</label>
               <input type="date" id="CL_END_DATE" class="form-control" name="CL_END_DATE" required value="<%=updateClass.getCL_END_DATE()%>"/>
            </div>
         </div>
         <section id="writeButtons" class="row">
            <input type="submit" id="classSubmit" class="btn btn-primary text-white col-md-6 col-sm-12" value="μμ νκΈ°">
            <input type="button" id="classCancel" class="btn btn-light float-right col-md-6 col-sm-12" value="μ·¨μ">
         </section>
      </form>
   </div>
<jsp:include page="/footer.jsp"/>
</body>

<script type="text/javascript">
var maxDate = new Date(new Date().getTime() + 365 * 24 * 60 * 60 * 1000).toISOString().substring(0, 10);
document.getElementById('CL_START_DATE').max = maxDate;
document.getElementById('CL_END_DATE').max = maxDate;

window.onbeforeunload = function() {
    return true;
};

function noAlert()
{
    	window.onbeforeunload = null;   
}

(function () {
     'use strict'
     // Fetch all the forms we want to apply custom Bootstrap validation styles to
     var forms = document.querySelectorAll('.needs-validation')
     // Loop over them and prevent submission
     Array.prototype.slice.call(forms)
       .forEach(function (form) {
         form.addEventListener('submit', function (event) {
           if (!form.checkValidity()) {
             event.preventDefault()
             event.stopPropagation()
           }else{
        	   if (confirm("μ λ§ μμ νμκ² μ΅λκΉ?") == true){    //νμΈ

      		     document.removefrm.submit();

      		 }else{   //μ·¨μ
      			 event.preventDefault()
  	             event.stopPropagation();

      		 }
         }
           form.classList.add('was-validated')
      }, false)
   })
})()

function readURL(input, previewId) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $(previewId).attr("src", e.target.result);
            $(previewId).hide();
            $(previewId).fadeIn(100);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
 
$(document).ready(function() {
   $("#CL_CONTENT").on('keyup', function(event) {
      var currentStr = $("#CL_CONTENT").val().length;
       if (currentStr < 250)  {
          document.getElementById("contentValidate").innerHTML = "250κΈμ μ΄μ μμ±ν΄μ£ΌμΈμ.";
          $("#contentValidate").css('display', 'inline');
       } else {$("#contentValidate").css('display', 'none');}
   });
   
   $("#CL_START_DATE").change(function(){
      var input = document.getElementById("CL_END_DATE");
       input.min = this.value;
       $('#CL_END_DATE').val(this.value);
   });
   $("#classCancel").click(function() {window.history.back();});
   
   $('#class_image_preview').click(function(){$('#CL_IMG_PATH').trigger('click');});
   
   $("#CL_IMG_PATH").change(function() {
	   var file = this.files[0];
	   var fileType = file["type"];
	   var validImageTypes = ["image/jpg", "image/jpeg", "image/png"];
	   if ($.inArray(fileType, validImageTypes) < 0) {
	       alert("μ΄λ―Έμ§ νμΌ(jpg, jpeg, png)λ§ λ±λ‘ κ°λ₯ν©λλ€.");
	   } else {

		       readURL(this, '#class_image_preview');
		       document.getElementById("whichPic").value="μμ¬μ§";
		       document.getElementById("nullDelIMG").style.display="inline";
		       document.getElementById("delIMG").style.display="inline";
	   }
   });  
  
   
   $("#delIMG").click(function(){
      document.getElementById("CL_IMG_PATH").value="";
      document.getElementById("class_image_preview").src="images/class_default.png";
      document.getElementById("whichPic").value="κΈ°λ³Έμ¬μ§";
      document.getElementById("delIMG").style.display="none";
      document.getElementById("curIMG").style.display="inline";
   });
   $("#curIMG").click(function(){
	 
		   var path = "/luna/upload/"+$("#pathI").val();
		   document.getElementById("CL_IMG_PATH").value="";
		      document.getElementById("class_image_preview").src=path;
		      document.getElementById("whichPic").value="κΈ°μ‘΄μ¬μ§";
		      document.getElementById("delIMG").style.display="inline";
		          document.getElementById("curIMG").style.display="none";
	   
   });
   $("#nullDelIMG").click(function(){
	   document.getElementById("CL_IMG_PATH").value="";
	      document.getElementById("class_image_preview").src="images/class_default.png";
	      document.getElementById("whichPic").value="κΈ°λ³Έμ¬μ§";
	      document.getElementById("nullDelIMG").style.display="none";
	   
   });
});
</script>
</html>
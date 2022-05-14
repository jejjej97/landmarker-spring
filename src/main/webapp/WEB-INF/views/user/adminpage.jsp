<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="list" value="${ requestScope.list }" />
<c:set var="name" value="${ requestScope.name }" />
<!DOCTYPE html>
<html>
<head>
<style>
.search input {
   width: 300px;
   height: 30px;
   border: 2px solid rgb(209, 207, 207);
   border-radius: 15px;
}

#searchName::placeholder {
   text-align: center;
   font-size: 14px;
   opacity: 0.7;
}

#nametag::placeholder {
   text-align: center;
   font-size: 18px;
   font-weight: 700;
}
#btn1 {
   width: 70px;
   padding: 2px;
   border-radius: 20px;
   box-shadow: none;
}
.img-wrapper {
             width: 100%;
            height: 100%;             
             background-repeat: no-repeat;
             background-size: cover;
             background-position: center;
         }
table {
   width: 100%;
   border: 0px solid #444444;
   border-collapse: collapse;
}

.tdd td {
   border: 0px solid #444444;
   align:center;
}      

.tdd th {
   border: 0px solid #444444;
   text-align:center;
   align:center;
   padding:5px 0px 3px 0px;
}

.myline {
   height: 1px;
   opacity: 0.4;
   background-color: gray;
}

.ban {
   height:150px;
   width:250px;
   background-color:lightgray;
}

#face {
   border-radius: 49px;
   background-color: #00B98E;
   margin: 10px;
   width: 100px;
   height: 100px;
}

.mynum {
   position: relative;
   top: -20px
}

.radio1 input[type="radio"] {
   display: none;
}

.radio1 input[type="radio"]+label {
   display: inline-block;
   font-size: 18px;
   font-weight: nomal;
   padding: 10px;
   opacity: 0.7;
   cursor: pointer;
}



.radio1 input[type="radio"]:checked+label {
   color: black;
   font-size: 20px;
   opacity: 1;
   font-weight: bolder;
}

.radio2 input[type="radio"] {
   display: block;
}
.conbox {
   margin: 0 auto;
   display: none;
}

input[id="tab01"]:checked ~ .con1 {
   display: block;
}

input[id="tab02"]:checked ~ .con2 {
   display: block;
}

input[id="tab03"]:checked ~ .con3 {
   display: block;
}

input[id="tab04"]:checked ~ .con4 {
   display: block;
}
textarea#t2 {
   width: 80%;
   height: 200px;
   padding: 10px;
   box-sizing: border-box;
   border: solid 2px #1E90FF;
   border-radius: 5px;
   font-size: 14px;
   resize: none;
}
.fileBox input[type="file"] {position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0,0,0,0);border:0}

</style>
<script type="text/javascript" 
   src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js">
</script>
<script type="text/javascript">

   function bannerbuttonClick() {
       str = $('#t2').val();
       str = str.replace(/\r\n/ig, '<br>');
       str = str.replace(/\\n/ig, '<br>');
       str = str.replace(/\n/ig, '<br>');
       $('#uptext').val(str);
       document.getElementById('bannersubmit').click();
   };
       
   // 로그인 가능/제한 라디오 체크를 변경했을 때 실행되는 함수임
   function changeLogin(element) {
      // 선택한 radio의 name속성의 이름에서 userid분리 추출함
      var user_no = element.name.substring(8);
      console.log("changeLogin : " + user_no);
      $.ajax({
             url: 'changeLoginOK.do',
             type: "post",
             data: {'user_no': user_no},
             dataType: "json",
             success:function(data){
                 console.log("로그인제한 바뀜");
             },
             error:function(jqXHR, textstatus, errorthrown){
               console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
            }
      })
   }
   function changeAdmin(element) {
      // 선택한 radio의 name속성의 이름에서 userid분리 추출함
      var user_no = element.name.substring(6);
      console.log("changeLogin : " + user_no);
      $.ajax({
             url: 'changeAdmin.do',
             type: "post",
             data: {'user_no': user_no},
             dataType: "json",
             success:function(data){
                 console.log("어드민권한 바뀜");
             },
             error:function(jqXHR, textstatus, errorthrown){
               console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown +"어드민변경오류");
            }
      })
   }
</script>

<title>Makaan - Real Estate HTML Template</title>
<c:import url="/WEB-INF/views/parts/head.jsp" />

</head>
<body>
   <div class="container-xxl bg-white p-0">
      <!-- Spinner Start -->
      <div id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
         <div class="spinner-border text-primary"
            style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
         </div>
      </div>
      <!-- Spinner End -->

      <!-- Navbar Start -->
      <c:import url="/WEB-INF/views/parts/navi.jsp" />
      <!-- Navbar End -->

      <!-- Header Start -->
      <div class="container-fluid header bg-white p-5">
         <br>
      </div>
      <!-- Header End -->
      <div class="container-xxl py-3">
         <div class="container">
            <br>
            <div class="row g-4">
               <div class="col-lg-12 col-md-12 wow fadeInUp" data-wow-delay="0.1s">
                  <div class="team-item rounded overflow-hidden">
                     <div class="p-3 mt-1">
                        <table class="tdd">
                           <tr height="10px">
                              <td rowspan="4" width="100px">
                                 <div id="face"></div>

                              </td>
                              <td width="400px"><div style="width: 400px;">
                                    <h3 class="fw-bold mb-0">&nbsp;&nbsp;관 리 자 &nbsp;&nbsp;   페 이 지</h5>
                                 </div></td>
                              <td width="28%"></td>
                              <td rowspan="2" colspan="2" align="right">
                              </td>
                           </tr>
                           <tr height="3px">
                              <td colspan="2" align="left"></td>
                           </tr>
                           <tr height="0px">
                              <td colspan="4"></div>
                                 <div style=""></div></td>
                           </tr>
                          
                        </table>
                     </div>
                  </div>
               </div>
               
               <div class="col-lg-12 col-md-12 wow fadeInUp mb-4" data-wow-delay="0.1s">
                  <div class="team-item rounded overflow-hidden">
                     <div class="p-4 mt-1">
                        <div class="tab_content radio1">
                           <input type="radio" name="tabmenu" id="tab01" checked>
                           <label for="tab01">베너 등록</label> 
                           <input type="radio" name="tabmenu" id="tab02"> 
                           <label for="tab02">베너 삭제</label>
                           <input type="radio" name="tabmenu" id="tab03"> 
                           <label for="tab03">회원관리</label>
                           <input type="hidden" name="tabmenu" id="tab04"> 
                           <label for="tab04" style="opacity:0;">신고된 사진</label>

                           <div class="conbox con1">
                           <form action="insertBanner.do" method="post" enctype="multipart/form-data">
                              <br>
                              <div class="myline"></div>
                              <br><br>
                              <!-- 베너등록창 -->
                              
                              <div class="fileBox" align="center">
                                 <div style="width:80%" align="left">
                                 <input required type="text" name="fileName" class="fileName" readonly="readonly" style="width:50%; height:40px;padding-left:10px;margin-right:10px;">
                                 
                                 <input required name="file" type="file" id="uploadBtn" class="uploadBtn" accept="image/png, image/jpeg">
                                 <label for="uploadBtn" class="btn btn-outline-primary active" style="width:130px;padding:10px; height:42px; box-shadow: none;">이미지 업로드</label> 
                                 </div>
                              </div>
                              <div style="padding-top:20px;" align="center">
                              
                              <input required type="text" style="width:80%; padding:10px;"
                                          placeholder="제목을 입력하세요..."
                                          onfocus="this.placeholder=''"
                                          onblur="this.placeholder='제목을 입력하세요...'"
                                          name="title" />
                              </div>
                              <div style="padding-top:20px" align="center">
                              <textarea required style="font-size:16px;" rows="10" id="t2" name="content" placeholder="내용을 입력하세요..."
                                          onfocus="this.placeholder=''"
                                          onblur="this.placeholder='내용을 입력하세요...'"></textarea>
                              <textarea  style="display: none;" id="uptext" name="uptext"></textarea>
                              </div>                              
                              <div style="padding-top:15px" align="center">
                                 <div style="width:80%" align="right">
                                 <input type="button" class="btn btn-outline-primary" style="box-shadow:none;" id="bannerbutton" value="저장" onClick="bannerbuttonClick()">
                                 <input type="submit" id="bannersubmit" style="display: none;">                                 
                                 </div>
                              </div>
                              <br>
                           </form>
                           </div>

                           <div class="conbox con2">
                              <br>
                              <div class="myline"></div>
                              <br>
                              <div align="center">
                              <!-- 베너삭제창 -->
                              <table class="tdd" style="width:80%;">
                                 <c:forEach items="${ requestScope.banner }" var="b">
                                    <tr>
                                       <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr>
                                       <td rowspan="2" style="width:270px; padding-right: 20px;">
                                          <div class="ban img-wrapper" 
                                             style="background-image: url('${ pageContext.servletContext.contextPath }/resources/banner/${ b.photo_path }');">
                                          </div>
                                       </td>
                                       <td style="height:15px; vertical-align:top; padding-bottom:10px;"><b style="font-size:18px;">${ b.banner_title }</b></td>
                                       <td rowspan="2" style="width:10%;vertical-align:top; text-align:center;">
                                       <c:url var="bd" value="bannerDelete.do">
                                          <c:param name="banner_no" value="${ b.banner_no }" />
                                       </c:url>
                                       <a href="${ bd }" class="btn btn-outline-primary active" style="box-shadow: none;">
                                       &nbsp;삭제&nbsp;
                                       </a></td>
                                    </tr>
                                    <tr>
                                       <td style="vertical-align:top;"><div style="opacity:0.8;">
                                       ${ b.banner_content }                                    
                                       </div></td>                                    
                                    </tr>
                                 </c:forEach>
                                 
                                 
                                 
                              </table>                           
                              </div>
                              <br><br>
                              <div class="myline"></div>
                              <br>
                           </div>
                           <div class="conbox con3">
                              <br>
                              <div class="myline"></div>
                              <br>
                              <div  align="center">                                 
                                 <div class="search">
                                    <input id="searchName" type="text" size="15"
                                       placeholder="검색할 이름을 입력하세요..." onfocus="this.placeholder=''"
                                       onblur="this.placeholder='검색할 이름을 입력하세요...'" name="user_name"  style="margin-bottom:10px;"/>
                                    &nbsp;
                                    <button id="btn1" class="btn btn-primary" type="submit" style="box-shadow: none;">search</button>
                                 </div>   
                              </div>
                              <div class="myline" style="margin-top:20px;margin-bottom:20px;"></div>
                              
                              <div style="width:100%">
                              <table id="userList" class="tdd" style="text-align:center;align:center">
                                 <tr style="background:#C2E8D6;">
                                    <th style="width:5px;"></th>
                                    <th></th>
                                    <th style="width:90px;">이름</th>
                                    <th>이메일</th>
                                    <th style="width:120px;"><div style="margin-bottom:-28px;">로그인</div><br>
                                    <div style="font-size:12px; opacity:0.7;">(Y/N)</div>
                                    </th>
                                    <th style="width:100px;"><div style="margin-bottom:-28px;">관리자</div><br>
                                    <div style="font-size:12px; opacity:0.7;">(Y/N)</div>
                                    </th>
                                    <th style="width:5px;"></th>
                                 </tr>
                                 <c:forEach items="${ requestScope.list }" var="l" varStatus="lc">
                                 <c:if test="${ lc.count % 2 ne 0 }">
                                    <tr>   
                                       <td></td>
                                       <td style="width:40px;padding:5px 0px 3px 0px;">${ l.user_no }</td>
                                       <td style="width:70px;">${ l.user_name }</td>
                                       <td style="opacity:0.8">${ l.user_email }</td>
                                       <td class="radio2">
                                       <c:if test="${ l.login_ok eq 'Y'}">
                                          <label style="margin-right:10px"><input type="radio" name="loginok_${ l.user_no }" onchange="changeLogin(this);" value="true" checked /> </label>
                                          <label><input type="radio" name="loginok_${ l.user_no }" onchange="changeLogin(this);"value="false" /></label>
                                       </c:if>
                                       <c:if test="${ l.login_ok eq 'N'}">
                                          <label style="margin-right:10px"><input type="radio" name="loginok_${ l.user_no }" onchange="changeLogin(this);" value="true" /></label>
                                          <label><input type="radio" name="loginok_${ l.user_no }" onchange="changeLogin(this);" value="false" checked/></label>
                                       </c:if>
                                       </td>
                                       <td class="radio2">
                                       <c:if test="${ l.user_admin eq 'Y'}">
                                          <label style="margin-right:10px"><input type="radio" name="admin_${ l.user_no }" onchange="changeAdmin(this);" value="true" checked /> </label>
                                          <label><input type="radio" name="admin_${ l.user_no }" onchange="changeAdmin(this);" value="false" /></label>
                                       </c:if>
                                       <c:if test="${ l.user_admin eq 'N'}">
                                          <label style="margin-right:10px"><input type="radio" name="admin_${ l.user_no }" onchange="changeAdmin(this);" value="true" /></label>
                                          <label><input type="radio" name="admin_${ l.user_no }" onchange="changeAdmin(this);" value="false" checked/></label>
                                       </c:if>
                                       </td>
                                       <td></td>
                                    </tr>
                                 </c:if>
                                    <c:if test="${ lc.count % 2 eq 0 }">
                                    <tr style="background:#E8FBF2">   
                                       <td></td>
                                       <td padding:5px 0px 3px 0px;">${ l.user_no }</td>
                                       <td style="width:70px;">${ l.user_name }</td>
                                       <td style="opacity:0.8">${ l.user_email }</td>
                                       <td style="width:70px;"class="radio2">
                                       <c:if test="${ l.login_ok eq 'Y'}">
                                          <label style="margin-right:10px"><input type="radio" name="loginok_${ l.user_no }" onchange="changeLogin(this);" value="true" checked /> </label>
                                          <label><input type="radio" name="loginok_${ l.user_no }" onchange="changeLogin(this);" value="false" /></label>
                                       </c:if>
                                       <c:if test="${ l.login_ok eq 'N'}">
                                          <label style="margin-right:10px"><input type="radio" name="loginok_${ l.user_no }" onchange="changeLogin(this);" value="true" /></label>
                                          <label><input type="radio" name="loginok_${ l.user_no }" onchange="changeLogin(this);" value="false" checked/></label>
                                       </c:if>
                                       </td>
                                       <td class="radio2">
                                       <c:if test="${ l.user_admin eq 'Y'}">
                                          <label style="margin-right:10px"><input type="radio" name="admin_${ l.user_no }" onchange="changeAdmin(this);" value="true" checked /> </label>
                                          <label><input type="radio" name="admin_${ l.user_no }" onchange="changeAdmin(this);" value="false" /></label>
                                       </c:if>
                                       <c:if test="${ l.user_admin eq 'N'}">
                                          <label style="margin-right:10px"><input type="radio" name="admin_${ l.user_no }" onchange="changeAdmin(this);" value="true" /></label>
                                          <label><input type="radio" name="admin_${ l.user_no }" onchange="changeAdmin(this);" value="false" checked/></label>
                                       </c:if>
                                       </td>
                                       <td></td>
                                    </tr>
                                 </c:if>
                                 </c:forEach>
                              </table>
                              </div>
         
                           </div>
                           <div class="conbox con4">
                              <br>
                              <div class="myline"></div>
                              <br>
                              <div style="height: 600px; width: 200px;">
                              </div>

                           </div>
                        </div>
                     </div>
                  </div>
               </div>

            </div>
         </div>
      </div>
      <!-- Team End -->


      <!-- Footer Start -->
      <c:import url="/WEB-INF/views/parts/footer.jsp" />
      <!-- Footer End -->


      <!-- Back to Top -->
      <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
         class="bi bi-arrow-up"></i></a>
   </div>

   <c:import url="/WEB-INF/views/parts/foot.jsp" />
</body>
<script type="text/javascript">
var uploadFile = $('.fileBox .uploadBtn');
uploadFile.on('change', function(){
   if(window.FileReader){
      var filename = $(this)[0].files[0].name;
   } else {
      var filename = $(this).val().split('/').pop().split('\\').pop();
   }
   $(this).siblings('.fileName').val(filename);
});

$('#searchName').keypress(function(e){
   if(e.keyCode == 13){
       $('#btn1').click();
   }
})

$('#btn1').click(function(){
   var user_name = $('#searchName').val();
   console.log(user_name);

   $.ajax({
       url: 'searchUserName.do',
       type: "post",
       data: {'user_name': user_name},
       dataType: "json",
       success:function(data){
           
           console.log("success : "+ data);
          
           var jsonStr = JSON.stringify(data);
           
           var json = JSON.parse(jsonStr);
           
           var values = "";
           if(jsonStr.length == 11){
              alert("검색결과가 없습니다.");                       
           }else{
             
              values +=
                   "<tr style='background:#C2E8D6;'>"
                  +"<th style='width:5px;'></th>"
                  +"<th></th>"
                  +"<th style='width:90px;'>이름</th>"
                  +"<th>이메일</th>"
                  +"<th style='width:120px;'><div style='margin-bottom:-28px;'>로그인</div><br>"
                  +"<div style='font-size:12px; opacity:0.7;'>(Y/N)</div>"
                  +"</th>"
                  +"<th style='width:100px;'><div style='margin-bottom:-28px;'>관리자</div><br>"
                  +"<div style='font-size:12px; opacity:0.7;'>(Y/N)</div>"
                  +"</th>"
                  +"<th style='width:5px;'></th>"
               +"</tr>"
               
              
           for(var i in json.list){
              
            console.log(json.list[i]);
            if(json.list[i].login_ok == "Y"){
             loginv=
                   "<label style='margin-right:10px'><input type='radio' name='loginok_"
               +json.list[i].user_no
               +"' onchange='changeLogin(this);' value='true' checked /> </label><label><input type='radio' name='loginok_"
               +json.list[i].user_no
               +"' onchange='changeLogin(this);' value='false' /></label>"
            }else{
            loginv=
               "<label style='margin-right:10px'><input type='radio' name='loginok_"
               +json.list[i].user_no
               +"' onchange='changeLogin(this);' value='true'/> </label><label><input type='radio' name='loginok_"
               +json.list[i].user_no
               +"' onchange='changeLogin(this);' value='false' checked/></label>"
            }
      
            if(json.list[i].user_admin == "Y"){
            adminv=
               "<label style='margin-right:10px'><input type='radio' name='admin_"
               +json.list[i].user_no
               +"'onchange='changeAdmin(this);' value='true' checked /> </label><label><input type='radio' name='admin_"
               +json.list[i].user_no
               +"'onchange='changeAdmin(this);'  value='false' /></label>"
            }else{
            adminv=
               "<label style='margin-right:10px'><input type='radio' name='admin_"
               +json.list[i].user_no
               +"'onchange='changeAdmin(this);' value='true'/> </label><label><input type='radio' name='admin_"
               +json.list[i].user_no
               +"'onchange='changeAdmin(this);' value='false' checked/></label>"
            }
            
               if(i % 2 == 0){
                    
                    
                 values += 
                       //----------------------------------------------------------------------------
                    "<tr><td></td><td style='width:40px;padding:5px 0px 3px 0px;'>"
                    +json.list[i].user_no
                    +"</td><td style='width:70px;'>"
                    +decodeURIComponent(json.list[i].user_name).replace(/\+/gi, " ")
                    +"</td><td style='opacity:0.8'>"
                    +json.list[i].user_email
                    +"</td><td class='radio2'>"
               + loginv
                   +"</td>"
               +"<td class='radio2'>"
               + adminv
               +"</td><td></td></tr>"
                      
                       //-------------------------------------------------------------
                 }else{
                      //----------------------------------------------------------------------------
                 values +=
                   "<tr style='background:#E8FBF2'><td></td><td style='width:40px;padding:5px 0px 3px 0px;'>"
                   +json.list[i].user_no
                   +"</td><td style='width:70px;'>"
                   +decodeURIComponent(json.list[i].user_name).replace(/\+/gi, " ")
                   +"</td><td style='opacity:0.8'>"
                   +json.list[i].user_email
                   +"</td><td class='radio2'>"
               + loginv
                   +"</td>"
               +"<td class='radio2'>"
               + adminv
               +"</td><td></td></tr>"
                    
                 }                    
              }
              $("#userList").empty();
              $("#userList").html($("#userList").html()+values);
           } 
       },
       error:function(jqXHR, textstatus, errorthrown){
         console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
      }
   });
})
</script>
</html>
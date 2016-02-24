<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="Javascript/signUp.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<div id="themeRegister"></div>

<div style="z-index: 1003; display: block; opacity: 1; bottom: 0px;" id="modalRegister" class="modal bottom-sheet">
  <div class="modal-content">
    <h4>Registrazione</h4>
    <div class="closeButtonRegister"><img onclick="deletePanelRegisterMobile()" src="images/closeButton.png"></div>
    <ul class="collection">
      <li class="collection-item avatar">
        <div class="image">
			<img src="images/profileImage/noImage.png"></img>
		</div>
       	<div class="form">
			<input id="email" class="textbox" placeholder="Email Address" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email Address';}" type="text">
			<input id="username" class="textbox" placeholder="Username" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Username';}" type="text">
			<input id="password" class="textbox" placeholder="Password" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password';}" type="password">
			<input onclick="createAccountMobile()" value="Create Account" type="submit">
		</div>
      </li>
    </ul>
  </div>
</div>

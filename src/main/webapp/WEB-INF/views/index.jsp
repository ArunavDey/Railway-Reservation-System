<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags"%>
        <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta charset="ISO-8859-1" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet" />
                <!-- CSS only -->
                <link rel="stylesheet" href="/css/index.css" />
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous" />
                <title>Document</title>
                <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
                <script type="text/javascript">
                    $(document).ready(function() {
                        $(".toast").toast("show");
                    });
                </script>
                <style>
                    body {
                        font-family: "Arial";
                    }
                </style>
            </head>

            <body>
                <div class="container" style="position: relative">
                    <!-- Toast Message -->
                    <c:if test="${not empty successfulmsg}">
                        <div class="toast show bg-success" style="position: absolute; top: 0; right: 0; z-index: 1" data-delay="2000">
                            <div class="toast-body text-white">
                                ${successfulmsg}<span><button
								type="button"
								class="ml-2 mb-1 close"
								data-dismiss="toast"
								aria-label="Close"
							>
								<span aria-hidden="true">&times;</span>
                                </button>
                                </span>
                            </div>
                        </div>
                    </c:if>
                    <!--Header-->
                    <div class="row">
                        <div class="col-md-12 mt-4">
                            <div class="page-header text-center" style="height: 50px">
                                <h1>Railway Reservation System</h1>
                            </div>
                        </div>
                    </div>
                    <c:if test="${not empty errMsg}">
                        <div class="alert alert-danger text-center" role="alert">
                            ${errMsg}
                        </div>
                    </c:if>
                    <div class="row mt-5">
                        <!--Form component-->
                        <div class="col mt-5">
                            <!--TAB-->
                            <nav>
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <a class="nav-link" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Login</a
							>
							<a
								class="nav-link"
								id="nav-profile-tab"
								data-toggle="tab"
								href="#nav-profile"
								role="tab"
								aria-controls="nav-profile"
								aria-selected="false"
								>Register</a
							>
						</div>
					</nav>

					<!--Tab-->
					<div class="tab-content" id="nav-tabContent">
						<!--SIGN IN-->

						<div
							class="tab-pane fade show active"
							id="nav-home"
							role="tabpanel"
							aria-labelledby="nav-home-tab"
						>
							<form role="form" action="/login" method="post">
								<div class="form-group text-center"></div>
								<c:if test="${param.error!=null}">
									<div
										class="alert alert-danger"
										role="alert"
									>
										Incorrect Credentials
									</div>
								</c:if>
								<c:if test="${not empty success}">
									<div
										class="alert alert-success"
										role="alert"
									>
										${success}
									</div>
								</c:if>
								<div class="form-group">
									<label for="exampleInputEmail1">
										E-mail Address
									</label>
									<input
										type="email"
										class="form-control"
										id="exampleInputEmail1"
										placeholder="name@domain.com"
										name="username"
										required
									/>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">
										Password
									</label>
									<input
										type="password"
										class="form-control"
										id="exampleInputPassword1"
										name="password"
										placeholder="Enter your password"
										required
									/>
								</div>
								<sec:csrfInput />
								<div class="form-group text-center">
									<button
										type="submit"
										class="btn btn-primary"
									>
										Login
									</button>
								</div>
							</form>
						</div>
						<div
							class="tab-pane fade"
							id="nav-profile"
							role="tabpanel"
							aria-labelledby="nav-profile-tab"
						>
							<form
								name="form"
								id="form"
								method="post"
								action="/signup"
							>
								<div class="row">
									<div class="col-6">
										<div class="form-group">
											<label for="exampleInputFirstName"
												>First Name</label
											>
											<input
												type="text"
												class="form-control"
												id="firstname"
												placeholder="Enter your first name"
												name="firstName"
											/>
											<em
												class="fas fa-check-circle"
											></em>
											<em
												class="fas fa-exclamation-circle"
											></em>
											<small
												id="firstNameError"
												class="text-danger"
												>Error message</small
											>
										</div>
									</div>

									<div class="col-6">
										<div class="form-group">
											<label for="exampleInputLastName"
												>Last Name</label
											>
											<input
												type="text"
												class="form-control"
												id="lastname"
												placeholder="Enter your last name"
												name="lastName"
											/>
											<em
												class="fas fa-check-circle"
											></em>
											<em
												class="fas fa-exclamation-circle"
											></em>
											<small
												id="lastNameError"
												class="text-danger"
												>Error message</small
											>
										</div>
									</div>

									<div class="col-md-12">
										<div class="form-group">
											<label for="exampleInputEmail1"
												>E-mail</label
											>
											<input
												type="email"
												class="form-control"
												id="email"
												placeholder="name@domain.com"
												name="email"
											/>
											<em
												class="fas fa-check-circle"
											></em>
											<em
												class="fas fa-exclamation-circle"
											></em>
											<small
												id="emailError"
												class="text-danger"
												>Error message</small
											>
										</div>
									</div>

									<div class="col-md-12">
										<div class="form-group">
											<label for="exampleInputPassword1"
												>Password</label
											>
											<input
												type="password"
												class="form-control"
												id="password"
												placeholder="Enter your password"
												name="password"
											/>
											<em
												class="fas fa-check-circle"
											></em>
											<em
												class="fas fa-exclamation-circle"
											></em>
											<small class="text-danger"
												>Error message</small
											>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="Password2"
												>Confirm Password</label
											>
											<input
												type="password"
												class="form-control"
												id="passwordCheck"
												placeholder="Re-enter your password"
												name="confirmPassword"
											/>
											<em
												class="fas fa-check-circle"
											></em>
											<em
												class="fas fa-exclamation-circle"
											></em>
											<small
												id="confirmPasswordError"
												class="text-danger"
												>Error message</small
											>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="exampleInputNumber"
												>Phone Number</label
											>
											<input
												type="text"
												class="form-control"
												id="mobilenumer"
												placeholder="9xxxxxxxxx"
												name="mobileNumber"
											/>
											<em
												class="fas fa-check-circle"
											></em>
											<em
												class="fas fa-exclamation-circle"
											></em>
											<small class="text-danger"
												>Error message</small
											>
										</div>
									</div>
									<div
										class="form-group col-md-12 text-center"
									>
										<button
											type="submit"
											class="btn btn-primary"
										>
											Register
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script
			src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
			integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
			crossorigin="anonymous"
		></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
			crossorigin="anonymous"
		></script>
		<script src="/js/myscript.js"></script>
	</body>
</html>
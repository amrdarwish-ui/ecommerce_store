import 'package:ecommerce_store/constants.dart';
import 'package:ecommerce_store/view/view_auth/sign_up.dart';
import 'package:ecommerce_store/view_model/auth_view_model.dart';
import 'package:ecommerce_store/widgets/custom_form_field.dart';
import 'package:ecommerce_store/widgets/custom_sign_with.dart';
import 'package:ecommerce_store/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIn extends GetWidget<AuthViewModel> {
  final controller = Get.put(AuthViewModel());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<AuthViewModel>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                txt: 'Welcome,'.tr,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(SignUp());
                                },
                                child: CustomText(
                                  txt: 'Sign Up'.tr,
                                  fontSize: 20,
                                  color: primaryGreen,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          CustomText(
                            txt: 'Sign In to Containue'.tr,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          CustomText(
                            txt: 'Email'.tr,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          CustomFormField(
                            onSaved: (val) {
                              controller.email = val;
                              print(controller.email);
                            },
                            obscure: false,
                            hintText: 'Exampl@email.com',
                            validate: (val) {
                              if (val == null || val == '') {
                                return 'Please enter Email';
                              }

                              return null;
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CustomText(
                            txt: 'password'.tr,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          CustomFormField(
                            onSaved: (val) {
                              controller.password = val;
                            },
                            hintText: 'Password'.tr,
                            obscure: true,
                            validate: (val) {
                              if (val == null || val == '') {
                                return 'Please enter Password';
                              }
                              return null;
                            },
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            alignment: Alignment.centerRight,
                            child: CustomText(
                              txt: 'Forgot Password?'.tr,
                              fontSize: 14,
                              align: TextAlign.right,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Container(
                            width: double.infinity,
                            height: size.height * 0.07,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    controller.signIn();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    elevation: 0, primary: primaryGreen),
                                child: CustomText(
                                  txt: 'sign in'.tr,
                                  fontSize: 18,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    txt: '-OR-'.tr,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomSignWith(
                  size: size,
                  imageLink:
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Facebook_icon_2013.svg/450px-Facebook_icon_2013.svg.png",
                  title: 'Sign In with facebook'.tr,
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    controller.SignInWithGoogle();
                  },
                  child: CustomSignWith(
                    size: size,
                    imageLink:
                        'https://cdn.freebiesupply.com/logos/large/2x/google-g-2015-logo-png-transparent.png',
                    title: 'Sign In with Google'.tr,
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

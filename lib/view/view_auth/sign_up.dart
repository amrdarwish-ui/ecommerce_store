import 'package:ecommerce_store/constants.dart';
import 'package:ecommerce_store/view_model/auth_view_model.dart';
import 'package:ecommerce_store/widgets/custom_form_field.dart';
import 'package:ecommerce_store/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends GetWidget<AuthViewModel> {
  final controller = Get.put(AuthViewModel());
  final _formKey = GlobalKey<FormState>();
  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
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
                        CustomText(
                          txt: 'Sign Up'.tr,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        CustomText(
                          txt: 'Name'.tr,
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        CustomFormField(
                          onSaved: (val) {
                            controller.name = val;
                          },
                          obscure: false,
                          hintText: 'Name'.tr,
                          validate: (val) {
                            if (val == null || val == '') {
                              return 'Please enter Name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomText(
                          txt: 'Email'.tr,
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        CustomFormField(
                          onSaved: (val) {
                            controller.email = val;
                          },
                          obscure: false,
                          hintText: 'Exampl@email.com',
                          validate: (val) {
                            if (val == null || val == '') {
                              return 'Please enter Email';
                            }
                            print('null');
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
                          hintText: 'Password',
                          onSaved: (val) {
                            controller.password = val;
                          },
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
                          height: size.height * 0.1,
                        ),
                        Container(
                          width: double.infinity,
                          height: size.height * 0.07,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.createUser();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 0, primary: primaryGreen),
                              child: CustomText(
                                txt: 'Sign Up'.tr.toUpperCase(),
                                fontSize: 18,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

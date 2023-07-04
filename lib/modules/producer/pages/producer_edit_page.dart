import 'package:flutter/material.dart';
import 'package:organaki_app/core/extensions.dart';
import 'package:organaki_app/core/colors_app.dart';
import 'package:organaki_app/modules/home/pages/home_orders_page.dart';

class ProducerEditPage extends StatefulWidget {
  const ProducerEditPage({super.key});

  @override
  State<ProducerEditPage> createState() => _ProducerEditPageState();
}

class _ProducerEditPageState extends State<ProducerEditPage> {
  @override
  void initState() {
    super.initState();
  }

  //final Producer producer;
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();
  final _aboutController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _fullNameController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Widget buildFormField(String nameField, String hintTextField,
      TextEditingController controllerField) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 28, right: 150, bottom: 5),
          child: SizedBox(
            width: 170.0,
            height: 25.0,
            child: Text(
              nameField,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: ColorApp.dark1,
                fontSize: 17,
                fontWeight: FontWeight.w500,
                fontFamily: 'Abhaya Libre',
              ),
            ),
          ),
        ),
        Container(
          width: 350.0,
          margin: const EdgeInsets.only(left: 30, right: 30),
          child: TextFormField(
            controller: controllerField,
            style: TextStyle(
              color: ColorApp.dark1,
              fontSize: 17,
              fontWeight: FontWeight.w500,
              fontFamily: 'Abhaya Libre',
            ),
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Icon(
                  Icons.edit,
                  color: ColorApp.blue4,
                ),
              ),
              contentPadding: const EdgeInsets.only(left: 15),
              filled: true,
              fillColor: ColorApp.white4,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(14.0),
                ),
                borderSide: BorderSide.none,
              ),
              hintText: hintTextField,
              hintStyle: TextStyle(
                color: ColorApp.grey3,
                fontSize: 17,
                fontWeight: FontWeight.w500,
                fontFamily: 'Abhaya Libre',
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.chevron_left,
            size: 35,
            weight: 10,
          ),
        ),
        title: Text(
          "Edit Information",
          style: TextStyle(
            color: ColorApp.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Abhaya Libre',
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: ColorApp.grey1,
            height: 1,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              //nesses campos, pensei em colocar os nomes de antes da edicao no hintText
              SizedBox(
                width: 124.0,
                height: 124.0,
                child: Stack(
                  children: [
                    Align(
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 25),
                        width: 124.0,
                        height: 124.0,
                        decoration: BoxDecoration(
                          color: ColorApp.blue4,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          size: 62.0,
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: const EdgeInsets.only(top: 25),
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: ColorApp.dark1,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          size: 20.0,
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              buildFormField(
                "Full Name",
                "Producer.name",
                _fullNameController,
              ),
              buildFormField(
                "Phone Number",
                "Producer.phone",
                _phoneController,
              ),
              buildFormField(
                "Password",
                "New Password",
                _passwordController,
              ),
              buildFormField(
                "About",
                "Producer.about",
                _aboutController,
              ),
              Container(
                margin: const EdgeInsets.only(top: 28, right: 150, bottom: 5),
                child: SizedBox(
                  width: 170.0,
                  height: 25.0,
                  child: Text(
                    "Tags",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorApp.dark1,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Abhaya Libre',
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 25,
                  left: 10,
                  right: 10,
                ),
                child: const TagsFilter(),
              ),
              buildFormField(
                "Location",
                "Producer.address",
                _addressController,
              ),
              Container(
                height: 250,
                margin: const EdgeInsets.only(top: 20),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 220,
                        child: Container(
                          width: 348,
                          decoration: BoxDecoration(
                            color: ColorApp.white4,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 60,
                        width: 194,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 25),
                        decoration: BoxDecoration(
                          color: ColorApp.blue3,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.my_location,
                              color: Colors.white,
                            ),
                            15.sizeW,
                            const Text(
                              "Pin Location",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Abhaya Libre',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(30),
                width: 348,
                height: 58,
                child: FilledButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      ColorApp.blue3,
                    ),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  child: Text(
                    "Save Changes",
                    style: TextStyle(
                      color: ColorApp.white1,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Abhaya Libre',
                      fontSize: 18,
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

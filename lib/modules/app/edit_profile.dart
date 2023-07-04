
import 'package:flutter/material.dart';
import 'package:social_master/shared/validate/validate.dart';
import '../../shared/styles/colors.dart';
import '../../models/usermodel.dart';
import '../../shared/components/components.dart';

class EditProfile extends StatefulWidget {
  EditProfile(this.user, {Key? key}) : super(key: key);
  UserModel user;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  DateTime date = DateTime.now();
  String? chosenDate = 'mm/dd/yyyy';
  late int selectedRadio;

  late final TextEditingController _firstNameController =
      TextEditingController(text: widget.user.fname);

  late final TextEditingController _lastNameController =
      TextEditingController(text: widget.user.lname);

  late final TextEditingController _phoneNumberController =
      TextEditingController(text: widget.user.phoneNumber);



  @override
  void initState() {
    super.initState();
    widget.user.isMale == 'male' ? selectedRadio = 1 : selectedRadio = 2;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Master",
          style: TextStyle(),
        )),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Edit your profile information:',
                    style: TextStyle(
                        fontFamily: 'SignikaNegative',
                        fontSize: 16,
                        color: AppTheme.colors.darkPurple,
                        fontWeight: FontWeight.bold)),
              ),
              Row(
                children: [
                  Expanded(
                    child: smallTextFormField(
                      validate: Validate.emptyValidate,
                      controller: _firstNameController,
                      label: 'first name',
                    ),
                  ),
                  Expanded(
                    child: smallTextFormField(
                      validate: Validate.emptyValidate,
                      controller: _lastNameController,
                      label: "last name",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              myTextFormField(
                  suffixOnPressed: () {},
                  prefixIcon: Icon(
                    Icons.phone,
                    color: AppTheme.colors.purple,
                  ),
                  controller: _phoneNumberController,
                  validate: Validate.emptyValidate,
                  label: "Phone Number",
                  inputType: TextInputType.number),
              const SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '-Your current birthdate is ${widget.user.birthDate} Set a new one if you want to change it.',
                    style: TextStyle(
                      fontFamily: 'SignikaNegative',
                      fontSize: 15,
                      color: AppTheme.colors.darkPurple,
                    )),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppTheme.colors.opacityPurple,
                  ),
                  height: 65,
                  child: Row(
                    children: [
                      myMaterialButton(
                          text: 'Select birthday',
                          height: 50,
                          width: 140,
                          fontSize: 16,
                          onPressed: () async {
                            DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime(2001, 7, 30),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2010),
                            );
                            if (newDate == null) return;
                            date = newDate;
                            chosenDate =
                                '${date.month}/${date.day}/${date.year}';
                            setState(() {});
                          }),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(chosenDate!,
                          style: TextStyle(
                              fontFamily: 'SignikaNegative',
                              fontSize: 22,
                              color: AppTheme.colors.darkPurple,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('-Set your new gender.',
                    style: TextStyle(
                      fontFamily: 'SignikaNegative',
                      fontSize: 15,
                      color: AppTheme.colors.darkPurple,
                    )),
              ),
              RadioListTile(
                  title: const Row(
                    children: [
                      Text(
                        'Male',
                        style: TextStyle(
                            fontSize: 26, fontFamily: 'SignikaNegative'),
                      ),
                      Icon(Icons.man)
                    ],
                  ),
                  activeColor: Colors.blue,
                  value: 1,
                  groupValue: selectedRadio,
                  onChanged: (val) {
                    setSelectedRadio(val!);
                  }),
              RadioListTile(
                  title: const Row(
                    children: [
                      Text(
                        'Female',
                        style: TextStyle(
                            fontSize: 26, fontFamily: 'SignikaNegative'),
                      ),
                      Icon(Icons.woman)
                    ],
                  ),
                  activeColor: Colors.red,
                  value: 2,
                  groupValue: selectedRadio,
                  onChanged: (val) {
                    setSelectedRadio(val!);
                  }),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: myMaterialButton(
                    width: 240,
                    height: 50,
                    text: "Confirm Changes",
                    fontSize: 22,
                    onPressed: () {
                      if(formKey.currentState!.validate()){}
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

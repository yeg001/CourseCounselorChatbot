%COURSE-AI-ASSIGNMENT
isEligible(10,['The score meets the required criteria.Kindly complete online form and proceed for fees payment.']).
isEligible(9,['The score meets the required criteria. Kindly complete online form and procced for fees payment.']).
isEligible(8,['Your score meets the required criteria.Kindly complete online form and proceed for fees payment.']).
isEligible(7,['Your score meets the required criteria.Kindly complete online form and proceed for fees paymnet.']).
isEligible(6,['Eligibility score criteria is not met']).
isEligible(5,['Eligibility score criteria is not met']).
isEligible(4,['Eligibility score criteria is not met']).
isEligible(3,['Eligibility score criteria is not met']).
isEligible(2,['Eligibility score criteria is not met']).
isEligible(1,['Eligibility score criteria is not met']).

lastDate([01,'Jan',2020]).

examDate([01,'FEB',2020]).

examCenters(['ABC College, Bengaluru, Karnataka - 560123',
              'DEF College,Bengaluru, Karnataka,560243',
              'GHI Chennai, Tamil Nadu 600456',
              'JKL Coimbatore, Tamil Nadu 600567',
              'MNO Gurgaon, Haryana, 1220123',
              'PQR P.O. Box 123456, DUBAI, UAE',
              'STU Campus, Zuarinagar, 403123',
              'VWX Campus, Secunderabad, Telangana 500123.',
              'YZA College, Kolkata,700123 West Bengal',
              'BCD College,Navi Mumbai,Maharashtra-400123',
              'EFG College, Pilani, Rajasthan 333031',
              'HIJ College, Pune, Maharashtra-411041']).

syllabus(['NCERT - 10th,11th,12th','CBSC - 10th,11th,12th','ICSE - 10th,11th,12th','NIOS - 10th,11th,12th']).

instruction(['We have collated the following good practices that would be useful for you to consider for a smooth and interruption free experience of the online proctored examinations:',
             'Login to the system on time for the examination. This ensures timely identity verification, system readiness and timely start of the online proctored examination.',
             'For any support concerning the examination platform, you may reach out to the online proctor through the system’s chat feature. This is your first line of support when you are still logged into the system.',
             'In case you face a technical difficulty and are unable to resolve it through your online proctor, you may call in the helpline number. This helpline number will connect you with a Tech Help Desk executive who will support you for any technical issue you might face with the examination platform. Helpline number will be shared via an email that also carries your exam link and login credentials. Aforesaid email will be sent you one day before the start of the examination.Helpline number will be active during your examinations only.',
             'Please note that while attempting the online proctored examinations there might be instances wherein the support team members may reach out to you to extend support especially in cases related to any technical issues faced by the students.Students are requested to kindly receive the call for assistance by the support team. Please note that in case you do not respond to calls made by our technical support team, you may face issues later on while uploading / submitting your answers. We request you to keep your mobile phones close by while attempting the examination for the same.',
             'Avoid delays and interruptions that might get caused due to undue high usage of the upload facility for answers written on A4 sheets. Follow the below guidelines to minimize the possibility of interruption in the online exam due to over use of the upload facility',
             'For questions where it is simple to directly input the entire answer into the system, please type in the answer using your laptop/desktop key board. Avoid writing and uploading the answers to such questions using A4 sheets and the system’s upload facility.',
             'For questions where it is simple to directly input a large part of the answer into the system, you may input that larger part of the answer using your laptop/desktop key board. A4 sheet should be used to write and upload those parts of the answer which might be tough to enter using a laptop/desktop key board because they may involve drawing a diagram or writing some complex equations etc.that is hard to input using a keyboard.',
             'Only for questions where answers primarily / mostly involve writing of complex equations and diagrams or any other content that is difficult to type in using the laptop/desktop’s keyboard, you may choose to entirely write and upload your answer using the A4 sheets.',
             'The above guidelines will help you avoid undue delays and interruptions during the examination on account of uploads.']).

scholarship(['Under university own merit award scheme Top 1% Students get 100% of total tuition fee as amount of scholarship' ,
            'Under university own merit award scheme Top 2% Students get 40% of total tuition fee as amount of scholarship' ,
            'Under university own merit-cum-need awards scheme 3% Students get 80% of total tuition fee as amount of scholarship' ,
            'Under university own merit-cum-need awards scheme 6% Students get 40% of total tuition fee as amount of scholarship' ,
            'Under university own merit-cum-need awards scheme 12% Students get 25% of total tuition fee as amount of scholarship' ,
            'Under university own merit-cum-need awards scheme 6% Students get 15% of total tuition fee as amount of scholarship',
            'For any further queries please send mail']).

student(regNumber2019ht11101,10).
student(regNumber2019ht11102,20).
student(regNumber2019ht11103,30).
student(regNumber2019ht11108,80).
student(regNumber2019ht11110,10).
student(regNumber2019ht11114,14).
student(regNumber2019ht11119,19).
student(regNumber2019ht11120,20).
student(regNumber2019ht11123,23).
student(regNumber2019ht11125,25).
student(regNumber2019ht11129,29).
student(regNumber2019ht11130,30).

basicScore(cs, 50).
basicScore(et, 40).
basicScore(ee, 55).
basicScore(mech, 40).
basicScore(civil, 45).

allotted(0,['Computer Science']).
allotted(1,['Computer Science']).
allotted(2,['Electronics and Telecommunication']).
allotted(3,['Electrical and Electronics']).
allotted(4,['Mechanical']).
allotted(5,['Mechanical']).
allotted(6,['Civil']).

fee(['Admission Fees : 43800',
     'Semester 1 fee : 199000',
     'Semester 2 fee : 199000',
	 'Students Union fee : 450',
	 'Students Aid Fund : 225',
     'Hostel, Mess & Electricity fee : 54300',
	 'Other Advances : 24000' ,
     'Institute Caution Deposit : 3000']).

payment(['online: pay from university payment portal']).

verifypaid(1,1).

















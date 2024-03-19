class StepupSIPListModel {
  String? message;
  List<StepupListData>? data;
  dynamic count;

  StepupSIPListModel({this.message, this.data, this.count});

  StepupSIPListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <StepupListData>[];
      json['data'].forEach((v) {
        data!.add(new StepupListData.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class StepupListData {
  dynamic id;
  String? sipApplicationUniqueId;
  dynamic tempSipApplicationId;
  dynamic merchantId;
  String? customerUniqueId;
  String? email;
  dynamic bankDetailId;
  String? planName;
  String? applicationDate;
  dynamic customerId;
  String? metalType;
  String? sipInvestmentTenure;
  dynamic sipInvestmentTenureInMonths;
  dynamic investmentAmount;
  dynamic sipInvestmentTenureId;
  dynamic sipCycleDateId;
  String? sipCycleDate;
  String? sipStartDate;
  String? sipEndDate;
  String? sipCycleDateDescription;
  String? source;
  String? userBelongsTo;
  String? paymentGatewayType;
  String? razorpayOrderId;
  String? razorpayCustomerId;
  dynamic redirectOn;
  String? razorpayPaymentId;
  String? razorpaySignature;
  String? tokenId;
  String? emandateStatus;
  dynamic emandateFailedReason;
  String? sipStatus;
  bool? isSipMatured;
  bool? isSipRenewed;
  bool? isSipTerminated;
  dynamic sipTerminationReason;
  dynamic sipTerminationDate;
  bool? isActive;
  dynamic jewellerName;
  dynamic jewellerStoreName;
  dynamic jewellerId;
  dynamic jewellerStoreId;
  dynamic utmSource;
  dynamic utmMedium;
  dynamic utmCampaign;
  dynamic paymentGatewayId;
  bool? isRefunded;
  String? investmentType;
  dynamic investmentDay;
  bool? isFdEnable;
  dynamic fdSchemeId;
  bool? isOldSip;
  dynamic currentInvestmentAmount;
  bool? isStepUpSip;
  bool? isStepUpEnable;
  String? createdAt;
  String? updatedAt;
  Customer? customer;
  BankDetails? bankDetails;
  PaymentDetails? paymentDetails;

  StepupListData(
      {this.id,
        this.sipApplicationUniqueId,
        this.tempSipApplicationId,
        this.merchantId,
        this.customerUniqueId,
        this.email,
        this.bankDetailId,
        this.planName,
        this.applicationDate,
        this.customerId,
        this.metalType,
        this.sipInvestmentTenure,
        this.sipInvestmentTenureInMonths,
        this.investmentAmount,
        this.sipInvestmentTenureId,
        this.sipCycleDateId,
        this.sipCycleDate,
        this.sipStartDate,
        this.sipEndDate,
        this.sipCycleDateDescription,
        this.source,
        this.userBelongsTo,
        this.paymentGatewayType,
        this.razorpayOrderId,
        this.razorpayCustomerId,
        this.redirectOn,
        this.razorpayPaymentId,
        this.razorpaySignature,
        this.tokenId,
        this.emandateStatus,
        this.emandateFailedReason,
        this.sipStatus,
        this.isSipMatured,
        this.isSipRenewed,
        this.isSipTerminated,
        this.sipTerminationReason,
        this.sipTerminationDate,
        this.isActive,
        this.jewellerName,
        this.jewellerStoreName,
        this.jewellerId,
        this.jewellerStoreId,
        this.utmSource,
        this.utmMedium,
        this.utmCampaign,
        this.paymentGatewayId,
        this.isRefunded,
        this.investmentType,
        this.investmentDay,
        this.isFdEnable,
        this.fdSchemeId,
        this.isOldSip,
        this.currentInvestmentAmount,
        this.isStepUpSip,
        this.isStepUpEnable,
        this.createdAt,
        this.updatedAt,
        this.customer,
        this.bankDetails,
        this.paymentDetails});

  StepupListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sipApplicationUniqueId = json['sipApplicationUniqueId'];
    tempSipApplicationId = json['tempSipApplicationId'];
    merchantId = json['merchantId'];
    customerUniqueId = json['customerUniqueId'];
    email = json['email'];
    bankDetailId = json['bankDetailId'];
    planName = json['planName'];
    applicationDate = json['applicationDate'];
    customerId = json['customerId'];
    metalType = json['metalType'];
    sipInvestmentTenure = json['sipInvestmentTenure'];
    sipInvestmentTenureInMonths = json['sipInvestmentTenureInMonths'];
    investmentAmount = json['investmentAmount'];
    sipInvestmentTenureId = json['sipInvestmentTenureId'];
    sipCycleDateId = json['sipCycleDateId'];
    sipCycleDate = json['sipCycleDate'];
    sipStartDate = json['sipStartDate'];
    sipEndDate = json['sipEndDate'];
    sipCycleDateDescription = json['sipCycleDateDescription'];
    source = json['source'];
    userBelongsTo = json['userBelongsTo'];
    paymentGatewayType = json['paymentGatewayType'];
    razorpayOrderId = json['razorpayOrderId'];
    razorpayCustomerId = json['razorpayCustomerId'];
    redirectOn = json['redirectOn'];
    razorpayPaymentId = json['razorpayPaymentId'];
    razorpaySignature = json['razorpaySignature'];
    tokenId = json['tokenId'];
    emandateStatus = json['emandateStatus'];
    emandateFailedReason = json['emandateFailedReason'];
    sipStatus = json['sipStatus'];
    isSipMatured = json['isSipMatured'];
    isSipRenewed = json['isSipRenewed'];
    isSipTerminated = json['isSipTerminated'];
    sipTerminationReason = json['sipTerminationReason'];
    sipTerminationDate = json['sipTerminationDate'];
    isActive = json['isActive'];
    jewellerName = json['jewellerName'];
    jewellerStoreName = json['jewellerStoreName'];
    jewellerId = json['jewellerId'];
    jewellerStoreId = json['jewellerStoreId'];
    utmSource = json['utmSource'];
    utmMedium = json['utmMedium'];
    utmCampaign = json['utmCampaign'];
    paymentGatewayId = json['paymentGatewayId'];
    isRefunded = json['isRefunded'];
    investmentType = json['investmentType'];
    investmentDay = json['investmentDay'];
    isFdEnable = json['isFdEnable'];
    fdSchemeId = json['fdSchemeId'];
    isOldSip = json['isOldSip'];
    currentInvestmentAmount = json['currentInvestmentAmount'];
    isStepUpSip = json['isStepUpSip'];
    isStepUpEnable = json['isStepUpEnable'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    bankDetails = json['bankDetails'] != null
        ? new BankDetails.fromJson(json['bankDetails'])
        : null;
    paymentDetails = json['paymentDetails'] != null
        ? new PaymentDetails.fromJson(json['paymentDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sipApplicationUniqueId'] = this.sipApplicationUniqueId;
    data['tempSipApplicationId'] = this.tempSipApplicationId;
    data['merchantId'] = this.merchantId;
    data['customerUniqueId'] = this.customerUniqueId;
    data['email'] = this.email;
    data['bankDetailId'] = this.bankDetailId;
    data['planName'] = this.planName;
    data['applicationDate'] = this.applicationDate;
    data['customerId'] = this.customerId;
    data['metalType'] = this.metalType;
    data['sipInvestmentTenure'] = this.sipInvestmentTenure;
    data['sipInvestmentTenureInMonths'] = this.sipInvestmentTenureInMonths;
    data['investmentAmount'] = this.investmentAmount;
    data['sipInvestmentTenureId'] = this.sipInvestmentTenureId;
    data['sipCycleDateId'] = this.sipCycleDateId;
    data['sipCycleDate'] = this.sipCycleDate;
    data['sipStartDate'] = this.sipStartDate;
    data['sipEndDate'] = this.sipEndDate;
    data['sipCycleDateDescription'] = this.sipCycleDateDescription;
    data['source'] = this.source;
    data['userBelongsTo'] = this.userBelongsTo;
    data['paymentGatewayType'] = this.paymentGatewayType;
    data['razorpayOrderId'] = this.razorpayOrderId;
    data['razorpayCustomerId'] = this.razorpayCustomerId;
    data['redirectOn'] = this.redirectOn;
    data['razorpayPaymentId'] = this.razorpayPaymentId;
    data['razorpaySignature'] = this.razorpaySignature;
    data['tokenId'] = this.tokenId;
    data['emandateStatus'] = this.emandateStatus;
    data['emandateFailedReason'] = this.emandateFailedReason;
    data['sipStatus'] = this.sipStatus;
    data['isSipMatured'] = this.isSipMatured;
    data['isSipRenewed'] = this.isSipRenewed;
    data['isSipTerminated'] = this.isSipTerminated;
    data['sipTerminationReason'] = this.sipTerminationReason;
    data['sipTerminationDate'] = this.sipTerminationDate;
    data['isActive'] = this.isActive;
    data['jewellerName'] = this.jewellerName;
    data['jewellerStoreName'] = this.jewellerStoreName;
    data['jewellerId'] = this.jewellerId;
    data['jewellerStoreId'] = this.jewellerStoreId;
    data['utmSource'] = this.utmSource;
    data['utmMedium'] = this.utmMedium;
    data['utmCampaign'] = this.utmCampaign;
    data['paymentGatewayId'] = this.paymentGatewayId;
    data['isRefunded'] = this.isRefunded;
    data['investmentType'] = this.investmentType;
    data['investmentDay'] = this.investmentDay;
    data['isFdEnable'] = this.isFdEnable;
    data['fdSchemeId'] = this.fdSchemeId;
    data['isOldSip'] = this.isOldSip;
    data['currentInvestmentAmount'] = this.currentInvestmentAmount;
    data['isStepUpSip'] = this.isStepUpSip;
    data['isStepUpEnable'] = this.isStepUpEnable;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.bankDetails != null) {
      data['bankDetails'] = this.bankDetails!.toJson();
    }
    if (this.paymentDetails != null) {
      data['paymentDetails'] = this.paymentDetails!.toJson();
    }
    return data;
  }
}

class Customer {
  String? customerUniqueId;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? email;

  Customer(
      {this.customerUniqueId,
        this.firstName,
        this.lastName,
        this.mobileNumber,
        this.email});

  Customer.fromJson(Map<String, dynamic> json) {
    customerUniqueId = json['customerUniqueId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobileNumber = json['mobileNumber'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerUniqueId'] = this.customerUniqueId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['mobileNumber'] = this.mobileNumber;
    data['email'] = this.email;
    return data;
  }
}

class BankDetails {
  dynamic id;
  dynamic customerId;
  dynamic paymentType;
  String? beneficiaryName;
  String? bankName;
  String? accountNumber;
  String? accountType;
  String? ifscCode;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  BankDetails(
      {this.id,
        this.customerId,
        this.paymentType,
        this.beneficiaryName,
        this.bankName,
        this.accountNumber,
        this.accountType,
        this.ifscCode,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  BankDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customerId'];
    paymentType = json['paymentType'];
    beneficiaryName = json['beneficiaryName'];
    bankName = json['bankName'];
    accountNumber = json['accountNumber'];
    accountType = json['accountType'];
    ifscCode = json['ifscCode'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customerId'] = this.customerId;
    data['paymentType'] = this.paymentType;
    data['beneficiaryName'] = this.beneficiaryName;
    data['bankName'] = this.bankName;
    data['accountNumber'] = this.accountNumber;
    data['accountType'] = this.accountType;
    data['ifscCode'] = this.ifscCode;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class PaymentDetails {
  String? mode;

  PaymentDetails({this.mode});

  PaymentDetails.fromJson(Map<String, dynamic> json) {
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mode'] = this.mode;
    return data;
  }
}

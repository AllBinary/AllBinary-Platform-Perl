#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package views::admin::workflow::NewView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::admin::workflow::WorkFlowView','org::allbinary::logic::control::validate::ValidationComponentInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{abeClientInformation} = 'org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory'->getInstance();
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        my $httpTransformInfoInterface = $self->getTransformInfoInterface();
        $self->{workFlowInterface} = 'org::allbinary::logic::control::workflow::NewWorkFlowFactory'->getInstance()->getInstance($self->{abeClientInformation}, $httpTransformInfoInterface->getPropertiesHashMap()->get($org::allbinary::business::DynamicObjectData::NAME));
    return $self;
}


sub isValid {
    my ($self) = @_;
        try {
            return 1;
        } catch ($e) {
            if ($views::admin::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to validate", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Please Contact Administrator");
            return $stringBuffer->toString();
        } catch ($e) {
            if ($views::admin::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to generate validation error info", $self, "validationInfo()", $e);
            }
            return "Error Getting Validation Info";
        }
}


sub toValidationInfoDoc {
    my ($self) = @_;
        return undef;
}


sub toValidationInfoNode {
    my ($self, $document) = @_;
        return undef;
}

use org::allbinary::business::DynamicObjectData;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::control::workflow::NewWorkFlowFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::admin::workflow::WorkFlowView;

1;


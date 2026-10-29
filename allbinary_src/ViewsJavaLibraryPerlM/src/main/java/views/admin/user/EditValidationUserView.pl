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

package views::admin::user::EditValidationUserView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::admin::user::UserView','org::allbinary::logic::control::validate::ValidationComponentInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{userName} = undef;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        my $httpServletRequest = $self->getPageContext()->getRequest();
        my $hashMap = 'org::allbinary::logic::communication::http::request::RequestParams'->new($httpServletRequest)->toHashMap();
        $self->{userName} = 'org::allbinary::business::user::username::UserName'->new($hashMap)->get();
    return $self;
}


sub isValid {
    my ($self) = @_;
        try {
            if ('org::allbinary::business::user::username::UserName'->getInstance()->isValid($self->{userName}) == 1) {
                $self->{user} = 'org::allbinary::data::tables::user::UserEntityFactory'->getInstance()->getUser($self->{userName});
                if (!defined($self->{user})) {
                    return 0;
                }
            } else {
                return 0;
            }
            return $self->{user}->isValid();
        } catch ($e) {
            if ($views::admin::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to validate form", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            if ('org::allbinary::business::user::username::UserName'->getInstance()->isValid($self->{userName}) == 1) {
                if ($views::admin::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF("User Name is valid", $self, "validationInfo()");
                }
                $self->{user} = 'org::allbinary::data::tables::user::UserEntityFactory'->getInstance()->getUser($self->{userName});
                if (!defined($self->{user})) {
                    $stringBuffer->append("User does not exist.<br />");
                    return $stringBuffer->toString();
                }
            } else {
                $stringBuffer->append("User Name is not valid.<br />");
                return $stringBuffer->toString();
            }
            if ($self->{user}->isValid() == 0) {
                if ($views::admin::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF("User exists but is invalid - Probably manually modified", $self, "validationInfo()");
                }
                $stringBuffer->append("User data is not valid - Please call administrator.<br />");
                $stringBuffer->append($self->{user}->validationInfo());
            }
            return $stringBuffer->toString();
        } catch ($e) {
            if ($views::admin::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to generate validation error info", $self, "validationInfo()", $e);
            }
            return "Error Validating Form";
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

use java::util::HashMap;
# use javax::servlet::http::HttpServletRequest;
use org::allbinary::business::user::username::UserName;
use org::allbinary::data::tables::user::UserEntityFactory;
use org::allbinary::logic::communication::http::request::RequestParams;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::admin::user::UserView;

1;


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

package views::admin::user::AddValidationUserView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::HttpContextView','org::allbinary::logic::control::validate::ValidationComponentInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{user} = undef;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{user} = 'org::allbinary::business::user::NewUserFactory'->getInstance($transformInfoInterface);
    return $self;
}


sub isValid {
    my ($self) = @_;
        try {
            if (defined('org::allbinary::data::tables::user::UserEntityFactory'->getInstance()->getUser($self->{user}->getUserName()))) {
                if ($views::admin::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF("User already in existance.", $self, $self->{commonStrings}->{IS_VALID});
                }
                return 0;
            }
            if ($self->{user}->isValid() == 0) {
                return 0;
            }
            return 1;
        } catch ($e) {
            if ($views::admin::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to validate", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            if (defined('org::allbinary::data::tables::user::UserEntityFactory'->getInstance()->getUser($self->{user}->getUserName()))) {
                if ($views::admin::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF("User already exists", $self, "validationInfo()");
                }
                $stringBuffer->append("The User Name you selected is already in use.<br/>  Please select another User Name.<br />");
            }
            if ($self->{user}->isValid() == 0) {
                $stringBuffer->append($self->{user}->validationInfo());
            }
            return $stringBuffer->toString();
        } catch ($e) {
            if ($views::admin::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
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


# throws Exception
sub view {
    my ($self) = @_;
        return $self->{views}->{ValidationOnlyTempUtil}->getInstance()->view($self);
}

use org::allbinary::business::user::NewUserFactory;
use org::allbinary::business::user::UserInterface;
use org::allbinary::data::tables::user::UserEntityFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::business::context::HttpContextView;

1;


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

package views::generic::user::UsersValidationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::generic::user::UsersView','org::allbinary::logic::control::validate::ValidationComponentInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{userVector} = 'org::allbinary::data::tables::user::UserEntityFactory'->getInstance()->getCustomers();
    return $self;
}


sub isValid {
    my ($self) = @_;
        try {
            if ($self->{userVector}->size() > 0) {
                return 1;
            } else {
                return 0;
            }
        } catch ($e) {
            if ($views::generic::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to validate", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub validationInfo {
    my ($self) = @_;
        try {
            return "No Users";
        } catch ($e) {
            if ($views::generic::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
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

use org::allbinary::data::tables::user::UserEntityFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::generic::user::UsersView;

1;


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

package org::allbinary::business::category::properties::CategoryPropertiesValidationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::category::properties::CategoryPropertiesView','org::allbinary::logic::control::validate::ValidationInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class, $categoryPropertiesInterface) = @_;
    my $self = $class->SUPER::new($categoryPropertiesInterface);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


# throws Exception
sub isValid {
    my ($self) = @_;
        return $self->{categoryPropertiesInterface}->isValid();
}


# throws Exception
sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append($self->{categoryPropertiesInterface}->validationInfo());
            return $stringBuffer->toString();
        } catch ($e) {
            if ($org::allbinary::business::category::properties::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::category::properties::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to generate validation info error", $self, "validationInfo()", $e);
            }
            return "Error Validating Data";
        }
}


# throws Exception
sub toValidationInfoDoc {
    my ($self) = @_;
        return undef;
}


# throws Exception
sub toValidationInfoNode {
    my ($self, $document) = @_;
        return undef;
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::ValidationInterface;
use org::allbinary::logic::string::StringMaker;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::category::properties::CategoryPropertiesView;

1;


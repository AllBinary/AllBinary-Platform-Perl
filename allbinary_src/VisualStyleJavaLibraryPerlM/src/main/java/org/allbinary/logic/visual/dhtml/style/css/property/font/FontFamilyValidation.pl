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

package org::allbinary::logic::visual::dhtml::style::css::property::font::FontFamilyValidation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::dhtml::style::css::property::font::FontFamilyView','org::allbinary::logic::control::validate::ValidationInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of FontFamilyValidation takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = $class->SUPER::new($node);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


# throws Exception
sub isValid {
    my ($self) = @_;
        try {
            my $valid = 1;
            if ($org::allbinary::logic::visual::dhtml::style::css::property::font::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::dhtml::style::css::property::font::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("FontFamilyValidation", $self, $self->{commonStrings}->{IS_VALID});
            }
            if ($org::allbinary::logic::visual::dhtml::style::css::property::font::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::dhtml::style::css::property::font::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("CssValidation: " . $valid, $self, $self->{commonStrings}->{IS_VALID});
            }
            return $valid;
        } catch ($e) {
            if ($org::allbinary::logic::visual::dhtml::style::css::property::font::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::dhtml::style::css::property::font::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to validate data", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


# throws Exception
sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Css Font Family Property Validation Error");
            return $stringBuffer->toString();
        } catch ($e) {
            if ($org::allbinary::logic::visual::dhtml::style::css::property::font::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::dhtml::style::css::property::font::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
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
use org::allbinary::logic::visual::dhtml::style::css::property::font::FontFamilyView;

1;


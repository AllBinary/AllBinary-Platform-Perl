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

package org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleValidation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleView','org::allbinary::logic::control::validate::ValidationInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of TitleValidation takes " . scalar(@arguments) . " arguments";
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


sub _new1 {
    my ($class, $hashMap) = @_;
    my $self = $class->SUPER::new($hashMap);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub isValid {
    my ($self) = @_;
        try {
            if ($org::allbinary::logic::visual::transform::template::customizer::widgets::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::widgets::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("TitleValidation", $self, $self->{commonStrings}->{IS_VALID});
            }
            my $valid = 1;
            if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isValidRequired($self->getTitle(), 1, 'org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData'->getInstance()->{MAXLEN})) {
                $valid = 0;
            }
            if ($org::allbinary::logic::visual::transform::template::customizer::widgets::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::widgets::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("TitleValidation: " . $valid, $self, $self->{commonStrings}->{IS_VALID});
            }
            return $valid;
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::template::customizer::widgets::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::widgets::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to validate form", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Title is not valid.");
            return $stringBuffer->toString();
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::template::customizer::widgets::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::widgets::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
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
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::ValidationInterface;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringValidationUtil;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleView;
use org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData;

1;


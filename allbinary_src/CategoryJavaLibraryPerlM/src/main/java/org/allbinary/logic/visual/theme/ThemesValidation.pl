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

package org::allbinary::logic::visual::theme::ThemesValidation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::control::validate::Validation','org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{themeVector} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of ThemesValidation takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{themeVector} = 'org::allbinary::util::BasicArrayListD'->new();
    return $self;
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub _new1 {
    my ($class, $hashMap) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub isValid {
    my ($self) = @_;
        return 1;
}


sub validationInfo {
    my ($self) = @_;
        return undef;
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
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = $document->createElement('org::allbinary::logic::visual::theme::ThemesData'->getInstance()->{NAME});
        my $size = $self->{themeVector}->size();
        for (my $i = 0; $i < $size; $i++) {
            my $themeDomNodeInterface = $self->{themeVector}->get($i);
            $node->appendChild($themeDomNodeInterface->toXmlNode($document));
        }
        return $node;
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::control::validate::Validation;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::visual::theme::ThemesData;

1;


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

package org::allbinary::logic::visual::transform::template::customizer::includes::style::css::template::retail::EditCssStyleValidation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::template::customizer::includes::style::css::template::retail::CssStyleValidation','org::allbinary::logic::control::validate::ValidationInterface','org::allbinary::data::tree::dom::DomNodeInterface';


sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of EditCssStyleValidation takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub _new1 {
    my ($class, $document) = @_;
    my $self = $class->SUPER::new($document);
        # super(...) made $self above
    return $self;
}


sub _new1 {
    my ($class, $hashMap) = @_;
    my $self = $class->SUPER::new($hashMap);
        # super(...) made $self above
    return $self;
}


sub isValid {
    my ($self) = @_;
        return $self->SUPER::isValid();
}


sub validationInfo {
    my ($self) = @_;
        return $self->SUPER::validationInfo();
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
        my $node = $document->createElement('org::allbinary::logic::visual::dhtml::style::StylesData'->getInstance()->{NAME});
        my $styleNode = $document->createElement('org::allbinary::logic::visual::dhtml::style::StyleData'->getInstance()->{NAME});
        $node->appendChild($styleNode);
        $styleNode->appendChild('org::allbinary::logic::visual::dhtml::style::color::ColorsView'->new()->toXmlNode($document));
        my $size = $self->{cssStyleElementVector}->size();
        for (my $i = 0; $i < $size; $i++) {
            my $styleDomNodeInterface = $self->{cssStyleElementVector}->get($i);
            $styleNode->appendChild($styleDomNodeInterface->toXmlNode($document));
        }
        return $node;
}

use java::util::HashMap;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::logic::control::validate::ValidationInterface;
use org::allbinary::logic::visual::dhtml::style::StyleData;
use org::allbinary::logic::visual::dhtml::style::StylesData;
use org::allbinary::logic::visual::dhtml::style::color::ColorsView;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::visual::transform::template::customizer::includes::style::css::template::retail::CssStyleValidation;

1;


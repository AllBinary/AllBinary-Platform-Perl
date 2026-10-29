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

package org::allbinary::logic::visual::dhtml::style::css::property::CssPropertyView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{cssProperty} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of CssPropertyView takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $name) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{cssProperty} = 'org::allbinary::logic::visual::dhtml::style::css::property::CssProperty'->new($name);
    return $self;
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{cssProperty} = 'org::allbinary::logic::visual::dhtml::style::css::property::CssProperty'->new($node);
    return $self;
}


sub getProperty {
    my ($self) = @_;
        return $self->{cssProperty};
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        return $self->{cssProperty}->toXmlNode($document);
}

use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::visual::dhtml::style::css::property::CssProperty;

1;


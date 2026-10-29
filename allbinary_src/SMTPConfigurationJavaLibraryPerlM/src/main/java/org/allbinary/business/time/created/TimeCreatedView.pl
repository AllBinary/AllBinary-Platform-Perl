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

package org::allbinary::business::time::created::TimeCreatedView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{timeCreated} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of TimeCreatedView takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $timeCreated) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setTimeCreated($timeCreated);
    return $self;
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setTimeCreated('org::allbinary::business::time::created::TimeCreated'->new('org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($node)));
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        return 'org::allbinary::data::tree::dom::ModDomHelper'->createTextNode($document, 'org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED}, $self->getTimeCreated()->toString());
}


sub getTimeCreated {
    my ($self) = @_;
        return $self->{timeCreated};
}


sub setTimeCreated {
    my ($self, $timeCreated) = @_;
        $self->{timeCreated} = $timeCreated;
}

use org::allbinary::business::entry::EntryData;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::time::created::TimeCreated;

1;


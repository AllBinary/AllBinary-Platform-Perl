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

package org::allbinary::business::time::modified::TimeLastModifiedView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{timeLastModified} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of TimeLastModifiedView takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $timeLastModified) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setTimeLastModified($timeLastModified);
    return $self;
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setTimeLastModified('org::allbinary::business::time::modified::TimeLastModified'->new('org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($node)));
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        return 'org::allbinary::data::tree::dom::ModDomHelper'->createTextNode($document, 'org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED}, $self->getTimeLastModified()->toString());
}


sub getTimeLastModified {
    my ($self) = @_;
        return $self->{timeLastModified};
}


sub setTimeLastModified {
    my ($self, $timeLastModified) = @_;
        $self->{timeLastModified} = $timeLastModified;
}

use org::allbinary::business::entry::EntryData;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::time::modified::TimeLastModified;

1;


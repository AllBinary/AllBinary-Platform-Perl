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

package org::allbinary::input::automation::actions::script::condition::processors::input::BasicProfileActionScriptInputNode;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    die "No constructor of BasicProfileActionScriptInputNode takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
        my $actionNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::input::automation::actions::script::condition::processors::input::GenericProfileActionScriptInputData::NAME, $node->getChildNodes());
    return $self;
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = $document->createElement($org::allbinary::input::automation::actions::script::condition::processors::input::GenericProfileActionScriptInputData::NAME);
        return $node;
}

use org::allbinary::data::tree::dom::DomSearchHelper;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::input::automation::actions::script::condition::processors::input::GenericProfileActionScriptInputData;

1;


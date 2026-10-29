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

package org::allbinary::input::automation::module::actions::script::condition::processors::output::BasicProfileActionScriptOutputNode;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    die "No constructor of BasicProfileActionScriptOutputNode takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
        my $actionNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::input::automation::module::actions::script::condition::processors::output::GenericProfileActionScriptOutputData::NAME, $node->getChildNodes());
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
        my $node = $document->createElement($org::allbinary::input::automation::module::actions::script::condition::processors::output::GenericProfileActionScriptOutputData::NAME);
        return $node;
}

use org::allbinary::data::tree::dom::DomSearchHelper;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::input::automation::module::actions::script::condition::processors::output::GenericProfileActionScriptOutputData;

1;


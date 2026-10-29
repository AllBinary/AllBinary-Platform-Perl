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

package org::allbinary::input::automation::module::actions::script::condition::processors::output::BasicProfileActionScriptOutput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::actions::script::condition::processors::BasicProfileActionScriptProcessor','org::allbinary::input::automation::module::actions::script::condition::processors::output::ProfileActionScriptOutputInterface';


sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of BasicProfileActionScriptOutput takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $label, $node) = @_;
    my $self = $class->SUPER::new($label, $node);
        # super(...) made $self above
    return $self;
}


sub _new1 {
    my ($class, $label) = @_;
    my $self = $class->SUPER::new($label);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = $document->createElement($org::allbinary::input::automation::module::actions::script::condition::processors::output::GenericProfileActionScriptOutputData::NAME);
        return $node;
}

use org::allbinary::input::automation::actions::script::condition::processors::BasicProfileActionScriptProcessor;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::input::automation::module::actions::script::condition::processors::output::ProfileActionScriptOutputInterface;
use org::allbinary::input::automation::module::actions::script::condition::processors::output::GenericProfileActionScriptOutputData;

1;


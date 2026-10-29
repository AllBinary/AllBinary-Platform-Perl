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

package org::allbinary::input::automation::actions::script::condition::processors::input::ProfileActionScriptInputFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstance {
    my ($class, $node) = @_;
        my $profileActionScriptInputInterface = undef;
        if (defined('org::allbinary::data::tree::dom::DomSearchHelper'->getNodeNoThrow($org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInputData::NAME, $node->getChildNodes()))) {
            $profileActionScriptInputInterface = 'org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInput'->new($node);
        } elsif (defined('org::allbinary::data::tree::dom::DomSearchHelper'->getNodeNoThrow($org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInputData::NAME, $node->getChildNodes()))) {
            $profileActionScriptInputInterface = 'org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInput'->new($node);
        } else {
            die ("No Such ActionScript Input");
        }
        return $profileActionScriptInputInterface;
}

use org::allbinary::data::tree::dom::DomSearchHelper;
use org::w3c::dom::Node;
use org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInputData;
use org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInputData;
use org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInput;
use org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInput;

1;


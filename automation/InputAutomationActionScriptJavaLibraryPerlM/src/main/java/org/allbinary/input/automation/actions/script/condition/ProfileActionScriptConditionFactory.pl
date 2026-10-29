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

package org::allbinary::input::automation::actions::script::condition::ProfileActionScriptConditionFactory;
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
        my $profileActionScriptConditionInterface = undef;
        if (defined('org::allbinary::data::tree::dom::DomSearchHelper'->getNodeNoThrow($org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionData::NAME, $node->getChildNodes()))) {
            $profileActionScriptConditionInterface = 'org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptCondition'->new($node);
        } elsif (defined('org::allbinary::data::tree::dom::DomSearchHelper'->getNodeNoThrow($org::allbinary::input::automation::actions::script::condition::TimeIntervalActionScriptConditionData::NAME, $node->getChildNodes()))) {
            $profileActionScriptConditionInterface = 'org::allbinary::input::automation::actions::script::condition::TimeIntervalActionScriptCondition'->new($node);
        } elsif (defined('org::allbinary::data::tree::dom::DomSearchHelper'->getNodeNoThrow($org::allbinary::input::automation::actions::script::condition::AlwaysActionScriptConditionData::NAME, $node->getChildNodes()))) {
            $profileActionScriptConditionInterface = 'org::allbinary::input::automation::actions::script::condition::AlwaysActionScriptCondition'->new($node);
        }
        return $profileActionScriptConditionInterface;
}

use org::allbinary::data::tree::dom::DomSearchHelper;
use org::w3c::dom::Node;
use org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionData;
use org::allbinary::input::automation::actions::script::condition::TimeIntervalActionScriptConditionData;
use org::allbinary::input::automation::actions::script::condition::AlwaysActionScriptConditionData;
use org::allbinary::input::automation::actions::script::condition::AlwaysActionScriptCondition;
use org::allbinary::input::automation::actions::script::condition::TimeIntervalActionScriptCondition;
use org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptCondition;

1;


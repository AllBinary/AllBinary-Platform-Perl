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

package org::allbinary::input::automation::module::actions::script::condition::processors::output::ProfileActionScriptOutputFactory;
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
        my $profileActionScriptOutputInterface = undef;
        if (defined('org::allbinary::data::tree::dom::DomSearchHelper'->getNodeNoThrow($org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputData::NAME, $node->getChildNodes()))) {
            $profileActionScriptOutputInterface = 'org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutput'->new($node);
        } else {
            die ("No Such ActionScript Output");
        }
        return $profileActionScriptOutputInterface;
}

use org::allbinary::data::tree::dom::DomSearchHelper;
use org::w3c::dom::Node;
use org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputData;
use org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutput;

1;


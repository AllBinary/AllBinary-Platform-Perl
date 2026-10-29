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

package org::allbinary::input::automation::actions::script::condition::processors::input::InputAutomationTypeDefaultComboBoxModelFactory;
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
    my ($class) = @_;
        my $defaultComboBoxModel = 'org::allbinary::input::automation::actions::script::condition::processors::input::DefaultComboBoxModel'->new();
        my $set = 'org::allbinary::input::automation::robot::InputRobotFactory'->getInstance()->get()->keySet();
        my $nameArray = $set->toArray();
        my $size = scalar(@{$nameArray});
        for (my $index = 0; $index < $size; $index++) {
            $defaultComboBoxModel->addElement($nameArray->[$index]);
        }
        return $defaultComboBoxModel;
}

# use java::util::Set;
# use javax::swing;
use org::allbinary::input::automation::robot::InputRobotFactory;
use org::allbinary::input::automation::actions::script::condition::processors::input::DefaultComboBoxModel;

1;


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

package org::allbinary::input::automation::module::InputAutomationModuleFactoryInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getName {
    my ($self) = @_;
        return undef;
}


sub getConfigurationJPanel {
    my ($self) = @_;
        return undef;
}


sub getHelpSet {
    my ($self) = @_;
        return undef;
}


# throws Exception
sub getInstance {
    my ($self) = @_;
        return undef;
}

# use javax::help::HelpSet;
# use javax::swing;
use org::allbinary::thread::RunnableInterface;

1;


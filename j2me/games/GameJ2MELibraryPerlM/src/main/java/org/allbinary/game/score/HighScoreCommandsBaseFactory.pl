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

package org::allbinary::game::score::HighScoreCommandsBaseFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{HIGH_SCORE_COMMANDS} = undef;
}


sub new {
    my ($class, $HIGH_SCORE_COMMANDS) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{HIGH_SCORE_COMMANDS} = $HIGH_SCORE_COMMANDS;
    return $self;
}


sub isHighScoreCommand {
    my ($self, $command) = @_;
        for (my $index = scalar(@{$self->{HIGH_SCORE_COMMANDS}}) - 1; $index >= 0; $index--) {
            if ($command == $self->{HIGH_SCORE_COMMANDS}->[$index]) {
                return 1;
            }
        }
        return 0;
}


# throws Exception
sub getIndex {
    my ($self, $command) = @_;
        for (my $index = scalar(@{$self->{HIGH_SCORE_COMMANDS}}) - 1; $index >= 0; $index--) {
            if ($command == $self->{HIGH_SCORE_COMMANDS}->[$index]) {
                return $index;
            }
        }
        die ("No Such Command");
}

# use javax::microedition::lcdui::Command;
use org::allbinary::J2MEUtil;
use org::allbinary::logic::communication::log::LogUtil;

1;


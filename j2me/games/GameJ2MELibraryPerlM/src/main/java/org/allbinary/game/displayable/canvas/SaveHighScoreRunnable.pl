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

package org::allbinary::game::displayable::canvas::SaveHighScoreRunnable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{progressCanvas} = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
    $self->{isLast} = undef;
    $self->{textBox} = undef;
}


sub new {
    my ($class, $isLast, $textBox) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->{isLast} = $isLast;
        $self->{textBox} = $textBox;
    return $self;
}


sub run {
    my ($self) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        try {
            if ($self->{isLast}) {
                $self->{textBox}->submit();
            } else {
                $self->{textBox}->saveHighScore();
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $logUtil->put($commonStrings->{EXCEPTION}, $self, "run", $e);
            $self->{progressCanvas}->end();
        }
}

use java::lang::Object ();
use org::allbinary::game::score::displayable::HighScoreTextBox ();
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvas ();
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::string::CommonStrings ();

1;


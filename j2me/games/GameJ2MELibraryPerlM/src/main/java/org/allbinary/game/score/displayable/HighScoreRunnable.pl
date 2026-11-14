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

package org::allbinary::game::score::displayable::HighScoreRunnable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();
use parent -norequire,'org::allbinary::thread::ARunnable';


sub _init_fields {
    my ($self) = @_;
    $self->{highScoresCanvas} = undef;
}


sub new {
    my ($class, $highScoresCanvas) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
        $self->{highScoresCanvas} = $highScoresCanvas;
    return $self;
}


sub run {
    my ($self) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        my $highScoresCanvas = $self->{highScoresCanvas};
        try {
            my $isHTML = 'org::allbinary::J2MEUtil'->isHTML();
            if (!$isHTML) {
                while (!$highScoresCanvas->{hasPainted}) {
                }
                $highScoresCanvas->{hasPainted} = 0;
            }
            my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
            my $systemWrapper = 'org::allbinary::logic::ABSystemWrapper'->getInstance();
            my $currentTimeMillis = $systemWrapper->currentTimeMillis();
            $logUtil->putF($stringMaker->append("HighScoresCanvas - Request repaint to be sure: ")->appendlong($currentTimeMillis)->toString(), $self, $commonStrings->{RUN});
            $highScoresCanvas->{repaintBehavior}->onChangeRepaint($highScoresCanvas);
            if (!$isHTML) {
                while (!$highScoresCanvas->{hasPainted}) {
                }
            }
            $stringMaker->delete(0, $stringMaker->length());
            $logUtil->putF($stringMaker->append("HighScoresCanvas - Now that the canvas has completed repaint go ahead and fetch the scores: ")->appendlong($currentTimeMillis)->toString(), $self, $commonStrings->{RUN});
            $highScoresCanvas->executeUpdate();
        } catch ($e) {
            $logUtil->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
        }
}

use java::lang::Object ();
use org::allbinary::J2MEUtil ();
use org::allbinary::logic::ABSystemWrapper ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::string::StringMaker ();
use org::allbinary::string::CommonStrings ();
use org::allbinary::thread::ARunnable ();

1;


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

package org::allbinary::game::displayable::canvas::GameCanvasPauseRunnable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::displayable::canvas::GameRunnable';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{allBinaryGameCanvas} = undef;
}


sub new {
    my ($class, $allBinaryGameCanvas) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{allBinaryGameCanvas} = $allBinaryGameCanvas;
    return $self;
}


sub run {
    my ($self) = @_;
}


# throws Exception
sub processLoopSleep {
    my ($self) = @_;
        try {
            my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
            my $isOpenGL = $features->isDefault('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL});
            if ($isOpenGL) {
                $self->{allBinaryGameCanvas}->processSleep();
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
        }
}

use org::allbinary::AndroidUtil;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::displayable::canvas::GameRunnable;

1;


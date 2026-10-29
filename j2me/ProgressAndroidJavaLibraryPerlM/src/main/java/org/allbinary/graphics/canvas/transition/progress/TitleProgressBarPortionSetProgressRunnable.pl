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

package org::allbinary::graphics::canvas::transition::progress::TitleProgressBarPortionSetProgressRunnable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::canvas::transition::progress::ProgressRunnable';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class, $midletActivity, $progressCanvas) = @_;
    my $self = $class->SUPER::new($midletActivity, $progressCanvas);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub run {
    my ($self) = @_;
        try {
            my $progressCanvas = $self->{progressCanvas};
            $self->{midletActivity}->onSetProgress(int(($self->{progressCanvas}->getValue() + $self->{progressCanvas}->getMaxValue() / $progressCanvas->getPortion())), $self->{progressCanvas}->getText());
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
        }
}

use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::LogUtil;
use android::app::Activity;
use org::allbinary::graphics::canvas::transition::progress::ProgressRunnable;

1;


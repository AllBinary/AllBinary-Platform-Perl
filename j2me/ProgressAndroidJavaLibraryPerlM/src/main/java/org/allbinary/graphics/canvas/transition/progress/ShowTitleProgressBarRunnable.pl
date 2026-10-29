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

package org::allbinary::graphics::canvas::transition::progress::ShowTitleProgressBarRunnable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::canvas::transition::progress::ProgressRunnable';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{FADE_IN_HALF} = ['org::allbinary::animation::transition::TransistionTypes'->getInstance()->{FADE_IN_TO_HALF_ALPHA}, 'org::allbinary::animation::transition::TransistionTypes'->getInstance()->{FADE_IN_FROM_HALF_ALPHA}];
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
            $self->{midletActivity}->onShowProgress(0, $self->{FADE_IN_HALF});
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
        }
}

use org::allbinary::animation::transition::TransistionTypes;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::LogUtil;
use android::app::Activity;
use org::allbinary::graphics::canvas::transition::progress::ProgressRunnable;

1;


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

package org::allbinary::graphics::canvas::transition::progress::AndroidTitleProgressBar;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::canvas::transition::progress::ProgressCanvas';


sub _init_fields {
    my ($self) = @_;
    $self->{showTitleProgressBarRunnable} = 'org::allbinary::graphics::canvas::transition::progress::ShowTitleProgressBarRunnable'->new($self);
    $self->{dismissTitleProgressBarRunnable} = 'org::allbinary::graphics::canvas::transition::progress::DismissTitleProgressBarRunnable'->new($self);
    $self->{progressDialogPortionSetProgressRunnable} = 'org::allbinary::graphics::canvas::transition::progress::TitleProgressBarPortionSetProgressRunnable'->new($self);
    $self->{progressDialogSetProgressRunnable} = 'org::allbinary::graphics::canvas::transition::progress::TitleProgressBarSetProgressRunnable'->new($self);
    $self->{progressActivity} = $org::allbinary::android::activity::NullProgressActivity::NULL_PROGRESS_ACTIVITY;
    $self->{portion} = 0;
}


sub new {
    my ($class, $title, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($title, $backgroundBasicColor, $foregroundBasicColor);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub init {
    my ($self, $activity) = @_;
        $self->{progressActivity} = $activity;
}


sub isInitialized {
    my ($self) = @_;
        if ($self->{progressActivity} != $org::allbinary::android::activity::NullProgressActivity::NULL_PROGRESS_ACTIVITY) {
            return 1;
        } else {
            return 0;
        }
}


sub start {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{START_METHOD_NAME});
            $self->SUPER::start();
            $self->{progressActivity}->runOnUiThread($self->{showTitleProgressBarRunnable});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{START_METHOD_NAME}, $e);
        }
}


sub end {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{END_METHOD_NAME});
            $self->{progressActivity}->runOnUiThread($self->{dismissTitleProgressBarRunnable});
            $self->SUPER::end();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{END_METHOD_NAME}, $e);
        }
}


sub addPortion {
    my ($self, $value, $text, $index) = @_;
        try {
            $self->SUPER::addPortion($value, $text, $index);
            $self->{portion} = $value;
            $self->{progressActivity}->runOnUiThread($self->{progressDialogPortionSetProgressRunnable});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{ADD_PORTION}, $e);
        }
}


sub addNormalPortion {
    my ($self, $value, $text) = @_;
        try {
            $self->SUPER::addNormalPortion($value, $text);
            $self->{portion} = $value;
            $self->{progressActivity}->runOnUiThread($self->{progressDialogPortionSetProgressRunnable});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{ADD_PORTION}, $e);
        }
}


sub setValue {
    my ($self, $value) = @_;
        try {
            $self->SUPER::setValue($value);
            $self->{progressActivity}->runOnUiThread($self->{progressDialogSetProgressRunnable});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "setValue", $e);
        }
}


sub waitUntilDisplayed {
    my ($self) = @_;
}


sub paint {
    my ($self, $graphics) = @_;
}
{
    package org::allbinary::graphics::canvas::transition::progress::TitleProgressBarSetProgressRunnable;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{androidTitleProgressBar} = undef;
    }
    

    sub new {
        my ($class, $androidTitleProgressBar) = @_;
        my $self = bless({}, $class);
        $self->_init_fields();
            $self->{androidTitleProgressBar} = $androidTitleProgressBar;
        return $self;
    }
    

    sub run {
        my ($self) = @_;
            my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            try {
                my $value = int($self->{androidTitleProgressBar}->getValue());
                $self->{androidTitleProgressBar}->{progressActivity}->onTitleProgressBarSetProgress($value);
            } catch ($e) {
                $logUtil->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
            }
    }
    }

{
    package org::allbinary::graphics::canvas::transition::progress::TitleProgressBarPortionSetProgressRunnable;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{androidTitleProgressBar} = undef;
    }
    

    sub new {
        my ($class, $androidTitleProgressBar) = @_;
        my $self = bless({}, $class);
        $self->_init_fields();
            $self->{androidTitleProgressBar} = $androidTitleProgressBar;
        return $self;
    }
    

    sub run {
        my ($self) = @_;
            my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            try {
                my $value = int(($self->{androidTitleProgressBar}->getValue() + $self->{androidTitleProgressBar}->getMaxValue() / $self->{androidTitleProgressBar}->{portion}));
                $self->{androidTitleProgressBar}->{progressActivity}->onTitleProgressBarSetProgress($value);
            } catch ($e) {
                $logUtil->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
            }
    }
    }

{
    package org::allbinary::graphics::canvas::transition::progress::ShowTitleProgressBarRunnable;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{androidTitleProgressBar} = undef;
    }
    

    sub new {
        my ($class, $androidTitleProgressBar) = @_;
        my $self = bless({}, $class);
        $self->_init_fields();
            $self->{androidTitleProgressBar} = $androidTitleProgressBar;
        return $self;
    }
    

    sub run {
        my ($self) = @_;
            my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            try {
                my $maxValue = int($self->{androidTitleProgressBar}->getMaxValue());
                $self->{androidTitleProgressBar}->{progressActivity}->onShowTitleProgressBar($maxValue, 0);
            } catch ($e) {
                $logUtil->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
            }
    }
    }

{
    package org::allbinary::graphics::canvas::transition::progress::DismissTitleProgressBarRunnable;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{androidTitleProgressBar} = undef;
    }
    

    sub new {
        my ($class, $androidTitleProgressBar) = @_;
        my $self = bless({}, $class);
        $self->_init_fields();
            $self->{androidTitleProgressBar} = $androidTitleProgressBar;
        return $self;
    }
    

    sub run {
        my ($self) = @_;
            my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            try {
                $self->{androidTitleProgressBar}->{progressActivity}->onDismissTitleProgressBar();
            } catch ($e) {
                $logUtil->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
            }
    }
    }


# use javax::microedition::lcdui::Graphics;
use org::allbinary::android::activity::NullProgressActivity;
use org::allbinary::android::activity::ProgressActivityInterface;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvas;

1;


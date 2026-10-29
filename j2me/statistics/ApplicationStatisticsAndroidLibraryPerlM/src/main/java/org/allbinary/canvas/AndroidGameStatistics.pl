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

package org::allbinary::canvas::AndroidGameStatistics;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::canvas::BaseGameStatistics';


sub _init_fields {
    my ($self) = @_;
    $self->{view} = $org::allbinary::android::view::BaseViewWrapper::NULL_VIEW_WRAPPER;
    $self->{totalOnDraws} = 0;
    $self->{ANDROID_STRING_ARRAY} = [(undef) x (14)];
    $self->{TOTAL_ONDRAWS} = " Total onDraws: ";
    $self->{ONDRAWS_RATE} = " onDraws(/10) Sec: ";
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        for (my $index = 0; $index < scalar(@{$self->{ANDROID_STRING_ARRAY}}); $index++) {
            $self->{ANDROID_STRING_ARRAY}->[$index] = $stringUtil->{EMPTY_STRING};
        }
    return $self;
}


sub initView {
    my ($self, $view) = @_;
        $self->SUPER::init();
        $self->{view} = 'org::allbinary::android::view::ViewWrapper'->new($view);
        $self->{totalOnDraws} = 0;
}


sub process {
    my ($self) = @_;
        $self->{view}->postInvalidate();
}


sub nextOnDraw {
    my ($self) = @_;
        $self->{totalOnDraws}++;
}


sub toStringArray {
    my ($self) = @_;
        my $stringArray = $self->SUPER::toStringArray();
        for (my $index = 0; $index < scalar(@{$stringArray}); $index++) {
            $self->{ANDROID_STRING_ARRAY}->[$index] = $stringArray->[$index];
        }
        my $totalTime = $self->getTimeDelayHelper()->getElapsed($self->{gameTickTimeDelayHelper}->{startTime});
        $totalTime = (int($totalTime / 10000));
        $self->{ANDROID_STRING_ARRAY}->[10] = $self->{TOTAL_ONDRAWS};
        $self->{ANDROID_STRING_ARRAY}->[11] = ("" . ($self->{totalOnDraws}));
        $self->{ANDROID_STRING_ARRAY}->[12] = $self->{ONDRAWS_RATE};
        $self->{ANDROID_STRING_ARRAY}->[13] = ("" . (int($self->{totalOnDraws} / $totalTime)));
        return $self->{ANDROID_STRING_ARRAY};
}


sub toString {
    my ($self) = @_;
        my $totalTime = $self->getTimeDelayHelper()->getElapsed($self->{gameTickTimeDelayHelper}->{startTime});
        $totalTime = (int($totalTime / 1000));
        if ($totalTime > 0) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append($self->SUPER::toStringAt($totalTime));
            if ($self->{totalOnDraws} > 0) {
                $stringBuffer->append($self->{TOTAL_ONDRAWS});
                $stringBuffer->append(("" . ($self->{totalOnDraws})));
                $stringBuffer->append($self->{ONDRAWS_RATE});
                my $drawsOverTime = ("" . (int($self->{totalOnDraws} / $totalTime)));
                $stringBuffer->append($drawsOverTime);
            }
            return $stringBuffer->toString();
        } else {
            return $self->{NOT};
        }
}

use android::view::View;
use org::allbinary::android::view::BaseViewWrapper;
use org::allbinary::android::view::ViewWrapper;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::canvas::BaseGameStatistics;

1;


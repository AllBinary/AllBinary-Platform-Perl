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

package org::allbinary::graphics::form::ScrollCurrentSelectionForm;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::graphics::form::ScrollSelectionForm','org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{moveForSmallScreen} = undef;
    $self->{updateMyFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{myFontProcessor} = $self->{updateMyFontProcessor};
    $self->{processor} = 'org::allbinary::canvas::Processor'->getInstance();
    $self->{preItemIndexDx} = 'org::allbinary::graphics::form::ItemIndexDx'->getInstance();
    $self->{dx} = 0;
    $self->{dy} = 0;
    $self->{maxWidth} = 0;
}


sub new {
    my ($class, $title, $items, $formPaintableFactory, $border, $adjustedExtraBorder, $moveForSmallScreen, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($title, $items, $formPaintableFactory, $border, $adjustedExtraBorder, $backgroundBasicColor, $foregroundBasicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->{moveForSmallScreen} = $moveForSmallScreen;
    return $self;
}


# throws Exception
sub init {
    my ($self, $rectangle, $formType) = @_;
        $self->SUPER::init($rectangle, $formType);
        my $formTypeFactory = 'org::allbinary::graphics::form::FormTypeFactory'->getInstance();
        if ($formType == $formTypeFactory->{TEMP_HORIZONTAL_FORM}) {
            $self->{processor} = 'org::allbinary::graphics::form::TempHorizontalFormProcessor'->new($self);
            $self->{preItemIndexDx} = 'org::allbinary::graphics::form::TempHorizontalItemIndexDx'->new($self);
        } elsif ($formType == $formTypeFactory->{HORIZONTAL_FORM}) {
            $self->{processor} = 'org::allbinary::graphics::form::HorizontalFormProcessor'->new($self);
            $self->{preItemIndexDx} = 'org::allbinary::graphics::form::HorizontalItemIndexDx'->new($self);
        } elsif ($formType == $formTypeFactory->{VERTICAL_CENTER_FORM}) {
            $self->{processor} = 'org::allbinary::graphics::form::VerticalFormProcessor'->new($self);
            $self->{preItemIndexDx} = 'org::allbinary::graphics::form::VerticalItemIndexDx'->new($self);
        } elsif ($formType == $formTypeFactory->{NULL_FORM_TYPE}) {
        } else {
            $self->{logUtil}->putF($formTypeFactory->{UNK}, $self, $self->{commonStrings}->{INIT});
        }
        $self->{myFontProcessor} = $self->{updateMyFontProcessor};
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub processTempHorizontalForm {
    my ($self) = @_;
        $self->{dx} = $self->{x} - 30 + (POSIX::floor(($self->{rectangle}->getWidth()) / (2 ** (1))));
        $self->{dy} = $self->{y};
}


sub processHorizontalForm {
    my ($self) = @_;
        my $size = $self->size();
        my $totalWidth = 0;
        my $item = undef;
        for (my $index = 0; $index < $size; $index++) {
            $item = $self->get($index);
            $totalWidth += $item->getMinimumWidth() + $self->{border};
        }
        $self->{dx} = $self->{x} + (POSIX::floor(($self->{rectangle}->getWidth()) / (2 ** (1)))) - (POSIX::floor(($totalWidth) / (2 ** (1))));
        $self->{dy} = $self->{y} + (POSIX::floor(($self->{rectangle}->getHeight()) / (2 ** (1))));
        if ($self->{moveForSmallScreen}) {
            my $maxTitleHeight = 175;
            if ($self->{dy} < $maxTitleHeight) {
                $self->{dy} = $maxTitleHeight;
            }
        }
}


sub processVerticalForm {
    my ($self) = @_;
        my $totalHeight = 0;
        my $size = $self->size();
        my $item2 = undef;
        for (my $index = 0; $index < $size; $index++) {
            $item2 = $self->get($index);
            if ($self->{maxWidth} < $item2->getMinimumWidth()) {
                $self->{maxWidth} = $item2->getMinimumWidth();
            }
            $totalHeight += $item2->getMinimumHeight() + $self->{border};
        }
        $self->{dx} = (($self->{rectangle}->getWidth() - $self->{maxWidth}) / 2);
        if ($self->size() > 0) {
            $self->{dy} = $self->{y} + (($self->{rectangle}->getHeight() - $totalHeight) / 2);
            if ($self->{moveForSmallScreen}) {
                my $maxTitleHeight = 175;
                if ($self->{dy} < $maxTitleHeight) {
                    $self->{dy} = $maxTitleHeight;
                }
            }
        } else {
            $self->{dy} = $self->{y};
        }
}


sub getXTempHorizontalForm {
    my ($self, $index, $item, $dx, $dy) = @_;
        return $self->getDiffX($item);
}


sub getXHorizontalForm {
    my ($self, $index, $item, $dx, $dy) = @_;
        return 0;
}


sub getXVerticalForm {
    my ($self, $index, $item, $dx, $dy) = @_;
        return $self->getDiffX($item) + $self->{halfBorder};
}


sub getDiffX {
    my ($self, $item) = @_;
        return (POSIX::floor((($self->{maxWidth} - $item->getMinimumWidth())) / (2 ** (1))));
}


sub getDx {
    my ($self) = @_;
        return $self->{dx};
}


sub getDy {
    my ($self) = @_;
        return $self->{dy};
}


sub paint {
    my ($self, $graphics) = @_;
        try {
            $self->{processor}->process();
            my $delta = 0;
            my $deltaX = $self->getDx();
            my $deltaY = $self->getDy();
            my $size = $self->size();
            my $formTypeFactory = 'org::allbinary::graphics::form::FormTypeFactory'->getInstance();
            my $item = undef;
            for (my $index = 0; $index < $size; $index++) {
                $item = $self->get($index);
                my $diffX = $self->{preItemIndexDx}->getDx($index, $item, $self->{dx}, $self->{dy});
                if ($index == $self->getSelectedIndex()) {
                    $delta = $self->paintItem($graphics, $index, $item, $deltaX + $diffX, $deltaY);
                    $self->{paintable}->paint($graphics, $index, $deltaX + $diffX, $deltaY);
                } else {
                    $delta = $self->paintUnselectedItem($graphics, $index, $item, $deltaX + $diffX, $deltaY);
                    $self->{paintable}->paint($graphics, $index, $deltaX + $diffX, $deltaY);
                }
                if ($self->{formType} == $formTypeFactory->{TEMP_HORIZONTAL_FORM}) {
                } elsif ($self->{formType} == $formTypeFactory->{HORIZONTAL_FORM}) {
                    $deltaX = $delta;
                } elsif ($self->{formType} == $formTypeFactory->{VERTICAL_CENTER_FORM}) {
                    $deltaY = $delta;
                } else {
                    die ($formTypeFactory->{UNK});
                }
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{canvasStrings}->{PAINT}, $e);
        }
}
{
    package org::allbinary::graphics::form::TempHorizontalFormProcessor;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use POSIX ();
    use parent -norequire,'org::allbinary::canvas::Processor';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{scrollCurrentSelectionForm} = undef;
    }
    

    sub new {
        my ($class, $scrollCurrentSelectionForm) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{scrollCurrentSelectionForm} = $scrollCurrentSelectionForm;
        return $self;
    }
    

    # throws Exception
    sub process {
        my ($self) = @_;
            $self->{scrollCurrentSelectionForm}->processTempHorizontalForm();
            $self->{scrollCurrentSelectionForm}->{processor} = 'org::allbinary::canvas::Processor'->getInstance();
    }
    }

{
    package org::allbinary::graphics::form::HorizontalFormProcessor;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use POSIX ();
    use parent -norequire,'org::allbinary::canvas::Processor';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{scrollCurrentSelectionForm} = undef;
    }
    

    sub new {
        my ($class, $scrollCurrentSelectionForm) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{scrollCurrentSelectionForm} = $scrollCurrentSelectionForm;
        return $self;
    }
    

    # throws Exception
    sub process {
        my ($self) = @_;
            $self->{scrollCurrentSelectionForm}->processHorizontalForm();
            $self->{scrollCurrentSelectionForm}->{processor} = 'org::allbinary::canvas::Processor'->getInstance();
    }
    }

{
    package org::allbinary::graphics::form::VerticalFormProcessor;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use POSIX ();
    use parent -norequire,'org::allbinary::canvas::Processor';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{scrollCurrentSelectionForm} = undef;
    }
    

    sub new {
        my ($class, $scrollCurrentSelectionForm) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{scrollCurrentSelectionForm} = $scrollCurrentSelectionForm;
        return $self;
    }
    

    # throws Exception
    sub process {
        my ($self) = @_;
            $self->{scrollCurrentSelectionForm}->processVerticalForm();
            $self->{scrollCurrentSelectionForm}->{processor} = 'org::allbinary::canvas::Processor'->getInstance();
    }
    }

{
    package org::allbinary::graphics::form::TempHorizontalItemIndexDx;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use POSIX ();
    use parent -norequire,'org::allbinary::graphics::form::ItemIndexDx';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{scrollCurrentSelectionForm} = undef;
    }
    

    sub new {
        my ($class, $scrollCurrentSelectionForm) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{scrollCurrentSelectionForm} = $scrollCurrentSelectionForm;
        return $self;
    }
    

    # throws Exception
    sub getDx {
        my ($self, $index, $item, $dx, $dy) = @_;
            return $self->{scrollCurrentSelectionForm}->getXTempHorizontalForm($index, $item, $dx, $dy);
    }
    }

{
    package org::allbinary::graphics::form::HorizontalItemIndexDx;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use POSIX ();
    use parent -norequire,'org::allbinary::graphics::form::ItemIndexDx';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{scrollCurrentSelectionForm} = undef;
    }
    

    sub new {
        my ($class, $scrollCurrentSelectionForm) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{scrollCurrentSelectionForm} = $scrollCurrentSelectionForm;
        return $self;
    }
    

    # throws Exception
    sub getDx {
        my ($self, $index, $item, $dx, $dy) = @_;
            return $self->{scrollCurrentSelectionForm}->getXHorizontalForm($index, $item, $dx, $dy);
    }
    }

{
    package org::allbinary::graphics::form::VerticalItemIndexDx;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use POSIX ();
    use parent -norequire,'org::allbinary::graphics::form::ItemIndexDx';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{scrollCurrentSelectionForm} = undef;
    }
    

    sub new {
        my ($class, $scrollCurrentSelectionForm) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{scrollCurrentSelectionForm} = $scrollCurrentSelectionForm;
        return $self;
    }
    

    # throws Exception
    sub getDx {
        my ($self, $index, $item, $dx, $dy) = @_;
            return $self->{scrollCurrentSelectionForm}->getXVerticalForm($index, $item, $dx, $dy);
    }
    }


# use javax::microedition::lcdui::Graphics;
use org::allbinary::canvas::Processor;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::graphics::form::item::ABCustomItem;
use org::allbinary::graphics::form::ScrollSelectionForm;
use org::allbinary::graphics::form::ItemIndexDx;
use org::allbinary::graphics::form::FormTypeFactory;

1;


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

package org::allbinary::graphics::form::ScrollSelectionForm;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::graphics::form::PaintableForm';

our $NULL_SCROLL_SELECTION_FORM = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
our $NULL_SCROLL_SELECTION_HORIZONTAL_FORM = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
our $INSIDE_FORM = " inside form";
our $IS_IN_FORM = "isInForm";
our $GET_SELECTED_INDEX = "getSelectedIndexForPoint";

sub _init_fields {
    my ($self) = @_;
    $self->{rectangleCollisionUtil} = 'org::allbinary::math::RectangleCollisionUtil'->getInstance();
    $self->{border} = undef;
    $self->{halfBorder} = undef;
    $self->{buttonBasicColor} = undef;
    $self->{scrollSelectionFormFormTypeItemIndexPaintable} = 'org::allbinary::graphics::form::ItemIndexPaintable'->getInstance();
    $self->{formTypeItemIndexDx} = 'org::allbinary::graphics::form::ItemIndexDx'->getInstance();
    $self->{paintable} = 'org::allbinary::graphics::form::ItemPaintableFactory'->getInstance();
    $self->{adjustedExtraBorder} = undef;
}


sub createForm {
    my ($class, $title, $items, $formPaintableFactory, $border, $backgroundBasicColor, $foregroundBasicColor) = @_;
        try {
            if ($formPaintableFactory == 'org::allbinary::graphics::form::ItemPaintableFactory'->getInstance()) {
                return 'org::allbinary::graphics::form::ScrollSelectionForm'->new($title, $items, $formPaintableFactory, $border, -3, $backgroundBasicColor, $foregroundBasicColor);
            } else {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                $logUtil->putF($commonStrings->{EXCEPTION}, $logUtil, $commonStrings->{EXCEPTION});
                return 'org::allbinary::graphics::form::PaintableForm'->getNullPaintableForm();
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
            $logUtil->put($commonStrings->{EXCEPTION}, $logUtil, $commonStrings->{EXCEPTION}, $e);
            return 'org::allbinary::graphics::form::PaintableForm'->getNullPaintableForm();
        }
}


sub getNullScrollSelectionForm {
    my ($class) = @_;
        if ($org::allbinary::graphics::form::ScrollSelectionForm::NULL_SCROLL_SELECTION_FORM == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::graphics::form::ScrollSelectionForm::NULL_SCROLL_SELECTION_FORM = 'org::allbinary::graphics::form::ScrollSelectionForm'->createForm('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, [(undef) x (0)], 'org::allbinary::graphics::form::ItemPaintableFactory'->getInstance(), 0, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{BLACK}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE});
        }
        return $org::allbinary::graphics::form::ScrollSelectionForm::NULL_SCROLL_SELECTION_FORM;
}


sub getNullScrollSelectionFormHorizontal {
    my ($class) = @_;
        if ($org::allbinary::graphics::form::ScrollSelectionForm::NULL_SCROLL_SELECTION_HORIZONTAL_FORM == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::graphics::form::ScrollSelectionForm::NULL_SCROLL_SELECTION_HORIZONTAL_FORM = 'org::allbinary::graphics::form::ScrollSelectionForm'->createForm('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, [(undef) x (0)], 'org::allbinary::graphics::form::ItemPaintableFactory'->getInstance(), 0, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{BLACK}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE});
        }
        return $org::allbinary::graphics::form::ScrollSelectionForm::NULL_SCROLL_SELECTION_HORIZONTAL_FORM;
}


sub new {
    my ($class, $title, $items, $formPaintableFactory, $border, $adjustedExtraBorder, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($title, $items, $backgroundBasicColor, $foregroundBasicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->{adjustedExtraBorder} = $adjustedExtraBorder;
        $self->{buttonBasicColor} = $foregroundBasicColor;
        $self->{border} = $border;
        $self->{halfBorder} = (POSIX::floor(($border) / (2 ** (1))));
        $self->{paintable} = $formPaintableFactory->getInstanceItemPaintable($self);
    return $self;
}


# throws Exception
sub init {
    my ($self, $rectangle, $formType) = @_;
        $self->SUPER::init($rectangle, $formType);
        my $formTypeFactory = 'org::allbinary::graphics::form::FormTypeFactory'->getInstance();
        if ($formType == $formTypeFactory->{HORIZONTAL_FORM}) {
            $self->{scrollSelectionFormFormTypeItemIndexPaintable} = 'org::allbinary::graphics::form::ScrollSelectionFormHorizontalPaintable'->new($self);
            $self->{formTypeItemIndexDx} = 'org::allbinary::graphics::form::ScrollSelectionFormHorizontalDx'->new($self);
        } elsif ($formType == $formTypeFactory->{VERTICAL_CENTER_FORM}) {
            $self->{scrollSelectionFormFormTypeItemIndexPaintable} = 'org::allbinary::graphics::form::ScrollSelectionFormVerticalPaintable'->new($self);
            $self->{formTypeItemIndexDx} = 'org::allbinary::graphics::form::ScrollSelectionFormVericalDx'->new($self);
        } elsif ($formType == $formTypeFactory->{TEMP_HORIZONTAL_FORM}) {
            $self->{scrollSelectionFormFormTypeItemIndexPaintable} = 'org::allbinary::graphics::form::ScrollSelectionFormTempHorizontalPaintable'->new($self);
            $self->{formTypeItemIndexDx} = 'org::allbinary::graphics::form::ScrollSelectionFormTempHorizontalDx'->new($self);
        } elsif ($formType == $formTypeFactory->{NULL_FORM_TYPE}) {
        } else {
            die ($formTypeFactory->{UNK});
        }
}


sub paintItemHorizontal {
    my ($self, $graphics, $index, $item, $x, $y) = @_;
        my $width = $item->getMinimumWidth();
        return $x + $width + $self->{border};
}


sub paintItemVertical {
    my ($self, $graphics, $index, $item, $x, $y) = @_;
        my $height = $item->getMinimumHeight();
        return $y + $height + $self->{border};
}


sub paintItemTempHorizontal {
    my ($self, $graphics, $index, $item, $x, $y) = @_;
        return 0;
}


sub getSelectedIndexForPointHorizontalDx {
    my ($self, $index, $item, $dx, $dy) = @_;
        return $dx - $self->{halfBorder};
}


sub getSelectedIndexForPointVerticalDx {
    my ($self, $index, $item, $dx, $dy) = @_;
        return $dx + $self->getDiffX($item);
}


sub getSelectedIndexForPointTempHorizontalDx {
    my ($self, $index, $item, $dx, $dy) = @_;
        return $dx + $self->getDiffX($item);
}


sub append {
    my ($self, $item) = @_;
        return $self->SUPER::append($item);
}


# throws Exception
sub getSelectedItem {
    my ($self, $point) = @_;
        my $index = $self->getSelectedIndexForPoint($point);
        if ($index != -1) {
            return $self->get($index);
        } else {
            return 'org::allbinary::graphics::form::item::ABCustomItem'->getNullInstance();
        }
}


# throws Exception
sub getItemIndex {
    my ($self, $item) = @_;
        my $nextItem = undef;
        my $size = $self->size();
        for (my $index = 0; $index < $size; $index++) {
            $nextItem = $self->get($index);
            if ($nextItem == $item) {
                return $index;
            }
        }
        return -1;
}


sub getStartIndex {
    my ($self) = @_;
        return 0;
}


# throws Exception
sub getSelectedIndexForPoint {
    my ($self, $point) = @_;
        my $start = $self->getStartIndex();
        my $size = $self->size();
        my $dx = $self->getDx();
        my $dy = $self->getDy();
        my $formTypeFactory = 'org::allbinary::graphics::form::FormTypeFactory'->getInstance();
        my $commonLabels = 'org::allbinary::string::CommonLabels'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($commonLabels->{START_LABEL});
        $stringBuffer->appendint($start);
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
        $stringBuffer->append($commonLabels->{TOTAL_LABEL});
        $stringBuffer->appendint($size);
        $self->{logUtil}->putF($stringBuffer->toString(), $self, $org::allbinary::graphics::form::ScrollSelectionForm::GET_SELECTED_INDEX);
        my $item = undef;
        my $width = 0;
        my $height = 0;
        my $diffX = 0;
        for (my $index = $start; $index < $size; $index++) {
            $item = $self->get($index);
            $width = $item->getMinimumWidth();
            $height = $item->getMinimumHeight();
            $diffX = $self->{formTypeItemIndexDx}->getDx($index, $item, $dx, $dy);
            if ($self->{rectangleCollisionUtil}->isInside($diffX, $dy - $self->{halfBorder}, $diffX + $width + $self->{border}, $dy + $height + $self->{halfBorder} + 1, $point->getX(), $point->getY())) {
                $stringBuffer->delete(0, $stringBuffer->length());
                $stringBuffer->append($commonLabels->{ITEM_LABEL});
                $stringBuffer->append($item->getLabel());
                $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
                $stringBuffer->append($commonLabels->{INDEX_LABEL});
                $stringBuffer->appendint($index);
                $self->{logUtil}->putF($stringBuffer->toString(), $self, $org::allbinary::graphics::form::ScrollSelectionForm::GET_SELECTED_INDEX);
                return $index;
            }
            if ($self->{formType} == $formTypeFactory->{HORIZONTAL_FORM}) {
                $dx = $dx + $width + $self->{border};
                if ($dx > $self->{rectangle}->getMaxX()) {
                    last;
                }
            } elsif ($self->{formType} == $formTypeFactory->{VERTICAL_CENTER_FORM}) {
                $dy = $dy + $height + $self->{border};
                if ($dy > $self->{rectangle}->getMaxY()) {
                    last;
                }
            } elsif ($self->{formType} == $formTypeFactory->{NULL_FORM_TYPE}) {
            } else {
                die ($formTypeFactory->{UNK});
            }
        }
        return -1;
}


# throws Exception
sub processInputKey {
    my ($self, $gameKeyCode) = @_;
        my $formTypeFactory = 'org::allbinary::graphics::form::FormTypeFactory'->getInstance();
        if ($self->size() == 0) {
            return -1;
        }
        my $index = $self->getSelectedIndex();
        if ($self->{formType} == $formTypeFactory->{HORIZONTAL_FORM} || $self->{formType} == $formTypeFactory->{TEMP_HORIZONTAL_FORM}) {
            if ($gameKeyCode == $javax::microedition::lcdui::Canvas::RIGHT) {
                $index++;
            } elsif ($gameKeyCode == $javax::microedition::lcdui::Canvas::LEFT) {
                $index--;
            }
        } elsif ($self->{formType} == $formTypeFactory->{VERTICAL_CENTER_FORM}) {
            if ($gameKeyCode == $javax::microedition::lcdui::Canvas::DOWN) {
                $index++;
            } elsif ($gameKeyCode == $javax::microedition::lcdui::Canvas::UP) {
                $index--;
            }
        } elsif ($self->{formType} == $formTypeFactory->{NULL_FORM_TYPE}) {
        } else {
            die ($formTypeFactory->{UNK});
        }
        my $max = $self->size() - 1;
        if ($index < 0) {
            $self->setSelectedIndex(0);
        } elsif ($index > $max) {
            $self->setSelectedIndex($max);
        } else {
            $self->setSelectedIndex($index);
        }
        return -1;
}


sub isInForm {
    my ($self, $point) = @_;
        if ($self->{rectangleCollisionUtil}->isInside($self->{x}, $self->{y} - $self->{halfBorder}, $self->{rectangle}->getMaxX() + $self->{border}, $self->{rectangle}->getMaxY() + $self->{border}, $point->getX(), $point->getY())) {
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($point))->append($org::allbinary::graphics::form::ScrollSelectionForm::INSIDE_FORM)->toString(), $self, $org::allbinary::graphics::form::ScrollSelectionForm::IS_IN_FORM);
            return 1;
        }
        return 0;
}


# throws Exception
sub paintItem {
    my ($self, $graphics, $index, $item, $x, $y) = @_;
        $item->paintXY($graphics, $x, $y);
        my $width = $item->getMinimumWidth();
        my $height = $item->getMinimumHeight();
        $graphics->setColor(int($self->getButtonBasicColor()));
        my $adjustedBorder = 3;
        $graphics->drawRect($x - $self->{halfBorder} - $adjustedBorder, $y - $self->{halfBorder} - $adjustedBorder, $width + $self->{border} + $self->{adjustedExtraBorder}, $height + $self->{border} + $self->{adjustedExtraBorder});
        return $self->{scrollSelectionFormFormTypeItemIndexPaintable}->paint($graphics, $index, $item, $x, $y);
}


# throws Exception
sub paintUnselectedItem {
    my ($self, $graphics, $index, $item, $x, $y) = @_;
        $graphics->setColor(int($self->getButtonBasicColor()));
        $item->paintUnselected($graphics, $x, $y);
        return $self->{scrollSelectionFormFormTypeItemIndexPaintable}->paint($graphics, $index, $item, $x, $y);
}


sub getDiffX {
    my ($self, $item) = @_;
        return 0;
}


sub getDx {
    my ($self) = @_;
        return $self->{x};
}


sub getDy {
    my ($self) = @_;
        return $self->{y};
}


sub setButtonBasicColor {
    my ($self, $buttonBasicColor) = @_;
        $self->{buttonBasicColor} = $buttonBasicColor;
}


sub getButtonBasicColor {
    my ($self) = @_;
        return $self->{buttonBasicColor};
}
{
    package org::allbinary::graphics::form::ScrollSelectionFormHorizontalPaintable;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use POSIX ();
    use parent -norequire,'org::allbinary::graphics::form::ItemIndexPaintable';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{scrollSelectionForm} = undef;
    }
    

    sub new {
        my ($class, $scrollSelectionForm) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{scrollSelectionForm} = $scrollSelectionForm;
        return $self;
    }
    

    # throws Exception
    sub paint {
        my ($self, $graphics, $index, $item, $dx, $dy) = @_;
            return $self->{scrollSelectionForm}->paintItemHorizontal($graphics, $index, $item, $dx, $dy);
    }
    }

{
    package org::allbinary::graphics::form::ScrollSelectionFormVerticalPaintable;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use POSIX ();
    use parent -norequire,'org::allbinary::graphics::form::ItemIndexPaintable';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{scrollSelectionForm} = undef;
    }
    

    sub new {
        my ($class, $scrollSelectionForm) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{scrollSelectionForm} = $scrollSelectionForm;
        return $self;
    }
    

    # throws Exception
    sub paint {
        my ($self, $graphics, $index, $item, $dx, $dy) = @_;
            return $self->{scrollSelectionForm}->paintItemVertical($graphics, $index, $item, $dx, $dy);
    }
    }

{
    package org::allbinary::graphics::form::ScrollSelectionFormTempHorizontalPaintable;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use POSIX ();
    use parent -norequire,'org::allbinary::graphics::form::ItemIndexPaintable';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{scrollSelectionForm} = undef;
    }
    

    sub new {
        my ($class, $scrollSelectionForm) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{scrollSelectionForm} = $scrollSelectionForm;
        return $self;
    }
    

    # throws Exception
    sub paint {
        my ($self, $graphics, $index, $item, $dx, $dy) = @_;
            return $self->{scrollSelectionForm}->paintItemTempHorizontal($graphics, $index, $item, $dx, $dy);
    }
    }

{
    package org::allbinary::graphics::form::ScrollSelectionFormHorizontalDx;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use POSIX ();
    use parent -norequire,'org::allbinary::graphics::form::ItemIndexDx';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{scrollSelectionForm} = undef;
    }
    

    sub new {
        my ($class, $multipleScrollSelectionForm) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{scrollSelectionForm} = $multipleScrollSelectionForm;
        return $self;
    }
    

    # throws Exception
    sub getDx {
        my ($self, $index, $item, $dx, $dy) = @_;
            return $self->{scrollSelectionForm}->getSelectedIndexForPointHorizontalDx($index, $item, $dx, $dy);
    }
    }

{
    package org::allbinary::graphics::form::ScrollSelectionFormVericalDx;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use POSIX ();
    use parent -norequire,'org::allbinary::graphics::form::ItemIndexDx';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{scrollSelectionForm} = undef;
    }
    

    sub new {
        my ($class, $multipleScrollSelectionForm) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{scrollSelectionForm} = $multipleScrollSelectionForm;
        return $self;
    }
    

    # throws Exception
    sub getDx {
        my ($self, $index, $item, $dx, $dy) = @_;
            return $self->{scrollSelectionForm}->getSelectedIndexForPointVerticalDx($index, $item, $dx, $dy);
    }
    }

{
    package org::allbinary::graphics::form::ScrollSelectionFormTempHorizontalDx;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use POSIX ();
    use parent -norequire,'org::allbinary::graphics::form::ItemIndexDx';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{scrollSelectionForm} = undef;
    }
    

    sub new {
        my ($class, $multipleScrollSelectionForm) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{scrollSelectionForm} = $multipleScrollSelectionForm;
        return $self;
    }
    

    # throws Exception
    sub getDx {
        my ($self, $index, $item, $dx, $dy) = @_;
            return $self->{scrollSelectionForm}->getSelectedIndexForPointTempHorizontalDx($index, $item, $dx, $dy);
    }
    }


# use javax::microedition::lcdui::Canvas;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::form::item::ABCustomItem;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::math::RectangleCollisionUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::graphics::form::PaintableForm;
use org::allbinary::graphics::form::ItemPaintableFactory;
use org::allbinary::graphics::form::ItemIndexPaintable;
use org::allbinary::graphics::form::ItemIndexDx;
use org::allbinary::graphics::form::FormTypeFactory;

1;


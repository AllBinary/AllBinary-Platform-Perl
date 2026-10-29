# Generated Code Do Not Modify

package org::allbinary::graphics::form::PaintableForm;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::ABCustomForm';

our $NULL_PAINTABLE_FORM = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{canvasStrings} = 'org::allbinary::graphics::displayable::CanvasStrings'->getInstance();
    $self->{rectangle} = $org::allbinary::graphics::RectangleFactory::SINGLETON;
    $self->{x} = 0;
    $self->{y} = 0;
    $self->{formType} = 'org::allbinary::graphics::form::FormTypeFactory'->getInstance()->{NULL_FORM_TYPE};
}


sub getNullPaintableForm {
    my ($class) = @_;
        if ($org::allbinary::graphics::form::PaintableForm::NULL_PAINTABLE_FORM == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::graphics::form::PaintableForm::NULL_PAINTABLE_FORM = 'org::allbinary::graphics::form::PaintableForm'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, [(undef) x (0)], 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{BLACK}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE});
        }
        return $org::allbinary::graphics::form::PaintableForm::NULL_PAINTABLE_FORM;
}


sub new {
    my ($class, $title, $items, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($title, $items, $backgroundBasicColor, $foregroundBasicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->setSelectedIndex(0);
    return $self;
}


# throws Exception
sub init {
    my ($self, $rectangle, $formType) = @_;
        $self->{rectangle} = $rectangle;
        my $point = $self->{rectangle}->getPoint();
        $self->{x} = $point->getX();
        $self->{y} = $point->getY();
        $self->{formType} = $formType;
}


sub getWidth {
    my ($self) = @_;
        return $self->{rectangle}->getWidth();
}

use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::RectangleFactory;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::displayable::CanvasStrings;
use org::allbinary::graphics::form::item::ABCustomItem;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::graphics::form::ABCustomForm;
use org::allbinary::graphics::form::FormTypeFactory;

1;


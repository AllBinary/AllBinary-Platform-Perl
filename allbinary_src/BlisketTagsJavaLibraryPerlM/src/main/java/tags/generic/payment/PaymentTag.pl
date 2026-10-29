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

package tags::generic::payment::PaymentTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::StoreValidationTransformTag';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            $self->setName("Basic Payment View");
            $self->setObjectFile("views.generic.payment.ValidationView");
            if (defined($self->getCommand())) {
                if ($self->getCommand()->compareTo($org::allbinary::business::user::commerce::money::payment::PaymentData::VIEW) == 0 || $self->getCommand()->compareTo($org::allbinary::business::user::commerce::money::payment::PaymentData::CHANGE) == 0 || $self->getCommand()->compareTo($org::allbinary::business::user::commerce::money::payment::PaymentData::ADDNEW) == 0) {
                } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{INSERT}) == 0) {
                } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{DELETE}) == 0) {
                    return $self->{EVAL_BODY_INCLUDE};
                } elsif ($self->getCommand()->compareTo($org::allbinary::business::user::commerce::money::payment::PaymentData::SELECT) == 0) {
                    return $self->{EVAL_BODY_INCLUDE};
                } else {
                    die ("No Such View Command: " . $self->getCommand());
                }
                return $self->SUPER::doStartTag();
            }
            die ("Command Null");
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagLicensingRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use javax::servlet::jsp::JspTagException;
use org::allbinary::business::user::commerce::money::payment::PaymentData;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::system::security::licensing::LicensingException;
use tags::StoreValidationTransformTag;

1;


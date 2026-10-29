# Generated Code Do Not Modify

package org::allbinary::time::TimeTypeTest;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub millisForHourLocal {
    my ($class, $hour) = @_;
        my $cal = 'java::util::Calendar'->getInstance();
        $cal->set($java::util::Calendar::HOUR_OF_DAY, $hour);
        $cal->set($java::util::Calendar::MINUTE, 0);
        $cal->set($java::util::Calendar::SECOND, 0);
        $cal->set($java::util::Calendar::MILLISECOND, 0);
        return $cal->getTimeInMillis();
}


sub isNight_returnsTrue_for_hours_less_than_6 {
    my ($self) = @_;
        # Otherwise - statement - ForEachStmt

}


sub isNight_returnsTrue_for_hours_greater_than_18 {
    my ($self) = @_;
        # Otherwise - statement - ForEachStmt

}


sub isNight_returnsFalse_for_boundary_hours_6_and_18 {
    my ($self) = @_;
        # Otherwise - statement - ForEachStmt

}


sub getNightOrDay_returns_expected_label {
    my ($self) = @_;
        my $nightUtil = 'org::allbinary::time::TestableTimeTypeUtil'->new(0);
        'org::junit::jupiter::api::Assertions'->assertEquals($nightUtil->{NIGHT}, $nightUtil->getNightOrDay());
        my $dayUtil = 'org::allbinary::time::TestableTimeTypeUtil'->new(12);
        'org::junit::jupiter::api::Assertions'->assertEquals($dayUtil->{DAY}, $dayUtil->getNightOrDay());
}


sub getHourOfDay_long_converts_epoch_to_local_hour {
    my ($self) = @_;
        my $util = 'org::allbinary::time::TimeTypeUtil'->new();
        # Otherwise - statement - ForEachStmt

}


sub isNight_long_expected_ranges {
    my ($self) = @_;
        my $util = 'org::allbinary::time::TimeTypeUtil'->new();
        # Otherwise - statement - ForEachStmt

        # Otherwise - statement - ForEachStmt

}


sub getNightOrDay_long_consistency {
    my ($self) = @_;
        my $util = 'org::allbinary::time::TimeTypeUtil'->new();
        my $nightMillis = 'org::allbinary::time::TimeTypeTest'->millisForHourLocal(0);
        my $dayMillis = 'org::allbinary::time::TimeTypeTest'->millisForHourLocal(12);
        'org::junit::jupiter::api::Assertions'->assertEquals($util->{NIGHT}, $util->getNightOrDay($nightMillis));
        'org::junit::jupiter::api::Assertions'->assertEquals($util->{DAY}, $util->getNightOrDay($dayMillis));
}


sub boundaries_day_for_long_based_api {
    my ($self) = @_;
        my $util = 'org::allbinary::time::TimeTypeUtil'->new();
        # Otherwise - statement - ForEachStmt

}


sub constants_accessible_and_stable {
    my ($self) = @_;
        my $util = 'org::allbinary::time::TimeTypeUtil'->new();
        'org::junit::jupiter::api::Assertions'->assertEquals("Night", $util->{NIGHT});
        'org::junit::jupiter::api::Assertions'->assertEquals("Day", $util->{DAY});
}


sub getInstance_returns_same_singleton {
    my ($self) = @_;
        my $a = 'org::allbinary::time::TimeTypeUtil'->getInstance();
        my $b = 'org::allbinary::time::TimeTypeUtil'->getInstance();
        'org::junit::jupiter::api::Assertions'->assertSame($a, $b);
}
{
    package org::allbinary::time::TestableTimeTypeUtil;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use parent -norequire,'org::allbinary::time::TimeTypeUtil';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{hour} = undef;
    }
    

    sub new {
        my ($class, $hour) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{hour} = $hour;
        return $self;
    }
    

    sub getHourOfDay {
        my ($self) = @_;
            return $self->{hour};
    }
    }


use java::util::Calendar;
use org::junit::jupiter::api::Assertions;
use org::junit::jupiter::api::DisplayName;
use org::junit::jupiter::api::Test;
use org::allbinary::time::TimeTypeUtil;

1;


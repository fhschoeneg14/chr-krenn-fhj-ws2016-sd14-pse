package at.fhj.swd14.pse.person;

import org.junit.Assert;

public class AbstractPersonInformationDtoTester {

    public static void assertEquals(AbstractPersonInformationDto expected, AbstractPersonInformationDto actual) {
        Assert.assertEquals(expected.getId(), actual.getId());
        Assert.assertEquals(expected.getValue(), actual.getValue());
    }

}

// *************************************************************
// project:  Bobs Fishing Calculator!!
// *************************************************************

namespace BobsFishing.Calculator.Extended.Tests
{
    using BobsFishing.Calculator.Extended;
    using NUnit.Framework;

    public class ModuluTests
    {
        [TestCase(4, 2, 0)]
        [TestCase(10, 6, 4)]
        public void Modulu(int a, int b, int expectedResult)
        {
            var entity = new BobsExtendedFishingCalculator();

            Assert.AreEqual(expectedResult, entity.Modulo(a, b));
        }
    }
}
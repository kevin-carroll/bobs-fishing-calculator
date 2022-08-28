// *************************************************************
// project:  Bobs Fishing Calculator!!
// *************************************************************

namespace BobsFishing.Calculator.Tests
{
    using BobsFishing.Calculator;
    using NUnit.Framework;

    public class AddTests
    {
        [TestCase(4, 2, 6)]
        [TestCase(5, 1, 6)]
        [TestCase(9, 3, 12)]
        [TestCase(5, -1, 4)]
        public void Add(int a, int b, int expectedResult)
        {
            var entity = new BobsFishingCalculator();

            Assert.AreEqual(expectedResult, entity.Add(a, b));
        }
    }
}